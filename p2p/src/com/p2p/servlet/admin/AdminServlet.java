package com.p2p.servlet.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.p2p.bean.IDCardInfo;
import com.p2p.bean.Invest;
import com.p2p.bean.LoanInfo;
import com.p2p.bean.ManagerInfo;
import com.p2p.bean.UserInfo;
import com.p2p.service.IDCardInfoService;
import com.p2p.service.InterestService;
import com.p2p.service.InvestService;
import com.p2p.service.LoanService;
import com.p2p.service.ManagerService;
import com.p2p.service.MorGoodsService;
import com.p2p.service.RepaymentService;
import com.p2p.service.UserInfoService;
import com.p2p.service.impl.IDCardInfoServiceImpl;
import com.p2p.service.impl.InterestServiceImpl;
import com.p2p.service.impl.InvestServiceImpl;
import com.p2p.service.impl.LoanServiceImpl;
import com.p2p.service.impl.ManagerServiceImpl;
import com.p2p.service.impl.MorGoodsServiceImpl;
import com.p2p.service.impl.RepaymentServiceImpl;
import com.p2p.service.impl.UserInfoServiceImpl;
import com.p2p.util.PageUtil;

public class AdminServlet extends HttpServlet {
	private ManagerService managerService = new ManagerServiceImpl();
	private LoanService loanService = new LoanServiceImpl();
	private UserInfoService userService = new UserInfoServiceImpl();
	private InvestService investService = new InvestServiceImpl();
	private InterestService interestService = new InterestServiceImpl();
	private MorGoodsService morGoodsService =new MorGoodsServiceImpl();
	private RepaymentService repayementService = new RepaymentServiceImpl();
	private IDCardInfoService idCardService = new IDCardInfoServiceImpl();
	
	public AdminServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String op = request.getParameter("op");
		if(op!=null&&op.equals("login")){
	
			loginHandle(request,response);
				
		}else if (op!=null &&op.equals("userInfo")){
			
			getUserInfos(request,response);
		}else if(op!=null&&op.equals("loanInfo")){
			
			getLoanInfos(request,response);
		}else if(op!=null&&op.equals("investInfo")){
			
			getInvestInfos(request,response);
			
		}else if (op!=null&&op.equals("idCheck")){
			
			getIdCheckInfo(request,response);
			
		}else if(op!=null&&op.equals("investUsers")){
			
			getInvestUsers(request,response);
			
		}else if(op!=null&&op.equals("updateIDCardStatus")){
			
			updateIDCardStatus(request,response);
			
		}else if(op!=null&&op.equals("adminIndex")){
			
			getAdminIndexData(request,response);
			
		}else if(op!=null&&op.equals("loaUserMana")){
			
			getLoanUsers(request,response);
			
		}else if(op!=null&&op.equals("logout")){
			
			logout(request,response);
			
		}else if(op!=null&&op.equals("addAdmin")){
			
			addAddmin(request,response);
			
		}else if(op!=null&&op.equals("addminInfo")){
			
			getAddminInfo(request,response);
			
		}else if(op!=null&&op.equals("editUser")){
			editUser(request,response);
			
		}else if(op!=null&&op.equals("deleteAdmin")){
			deleteAdmin(request,response);
			
		}else if(op!=null&&op.equals("getAdmin")){
			editAdmin(request,response);
			
		}else if(op!=null&&op.equals("update")){
			updateAdmin(request,response);
			
		}

	}

	private void updateAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		String strId = request.getParameter("managerID");
		String phone = request.getParameter("phone");
		String managerName = request.getParameter("adminName");
		String password = request.getParameter("password");
		int id=-1;
		if(strId!=null){
			id = Integer.parseInt(strId);
			ManagerInfo manager =  new ManagerInfo();
			manager.setManagerID(id);
			manager.setManagerName(managerName);;
			manager.setmPassword(password);;
			manager.setPhone(phone);
			managerService.updateManager(manager);
		}
		try {
			response.sendRedirect("admin.action?op=addminInfo");
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void editAdmin(HttpServletRequest request,
			HttpServletResponse response) {
			String strId =  request.getParameter("id");
			ManagerInfo manager =null;
			int id=-1;
			JSONArray json=null;
			if(strId!=null){
				id =Integer.parseInt(strId);
				manager = managerService.findManagerById(id);
				json = JSONArray.fromObject(manager);
				try {
					response.getWriter().println(json);
					response.getWriter().flush();
					response.getWriter().close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
	}

	private void deleteAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		String strId  = request.getParameter("id");
		ManagerInfo manager=  new ManagerInfo();
		
		int mid =-1;
		if(strId!=null){
			mid= Integer.parseInt(strId);
			manager.setManagerID(mid);
			managerService.deleteManagerInfo(manager);
		}
		try {
			response.sendRedirect("admin.action?op=addminInfo");
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	private void editUser(HttpServletRequest request,
			HttpServletResponse response) {
		String strUid = request.getParameter("userId");
	
		UserInfo user = null;
		int uid= -1;
		if(strUid!=null){
			uid = Integer.parseInt(strUid);
			user = userService.findUserInfoById(uid);	
			List<LoanInfo> loanInfos = loanService.findLoanInfoByUserID(uid);
			float totalInv = investService.getTotalMoneyByUserId(uid);
			float totalLoan = 0.0f;
			for(LoanInfo info:loanInfos){
				totalLoan+=info.getLoanMoney();
			}
			request.getSession().setAttribute("userDetail", user);		
			request.getSession().setAttribute("totalLoan", totalLoan);		
			request.getSession().setAttribute("totalInv", totalInv);		
			try {
				response.sendRedirect("admin/userEdit.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	private void getAddminInfo(HttpServletRequest request,
			HttpServletResponse response) {
	
		PageUtil pg = new PageUtil(10,managerService.findAddminCount());
		String strNum =  request.getParameter("pageNum");
		if(strNum!=null){
			int pageNum = Integer.parseInt(strNum);
			pg.setCurPage(pageNum);
		}else{
			pg.setCurPage(1);
		}
		List<ManagerInfo> addminInfos = managerService.findAddminByPage(pg);
		request.getSession().setAttribute("addminInfos", addminInfos);
		request.getSession().setAttribute("page", pg);
		
		try {
			response.sendRedirect("admin/addminInfo.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

	private void addAddmin(HttpServletRequest request,
			HttpServletResponse response) {
			String addminName = request.getParameter("addminName"); 
			String password = request.getParameter("password");
	
			String phone = request.getParameter("phone");
			if(addminName!=null&&password!=null&&phone!=null){
				ManagerInfo manager = new ManagerInfo(0, addminName, password, phone);
				managerService.addManagerInfo(manager);
				try {
					response.sendRedirect("admin/info.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				try {
					request.getSession().setAttribute("result", "error");
					response.sendRedirect("admin/info.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("admin");
		try {
			response.sendRedirect("admin/login.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void getLoanUsers(HttpServletRequest request,
			HttpServletResponse response) {
		
			String strNum =  request.getParameter("pageNum");
			List<LoanInfo> loanInfos = null;
			PageUtil pg = new PageUtil(10, loanService.findLoanCount());
			if(strNum!=null){
				int pageNum = Integer.parseInt(strNum);
				pg.setCurPage(pageNum);
					loanInfos = loanService.findAllLoanInfo(pageNum, 10);
			}else{
				loanInfos = loanService.findAllLoanInfo(1, 10);
				pg.setCurPage(1);
			}
			Map<Integer,UserInfo> lUsers =  new HashMap<Integer,UserInfo>();
			UserInfo userInfo = null;
			for(LoanInfo loan : loanInfos){
				userInfo =userService.findUserInfoById(loan.getUserID());
				lUsers.put(userInfo.getUserID(), userInfo);
			}
		request.getSession().setAttribute("loanInfos", loanInfos);
		request.getSession().setAttribute("lUsers", lUsers);
		request.getSession().setAttribute("page", pg);
		try {
			response.sendRedirect("admin/loanUserInfo.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void getAdminIndexData(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String,Object> datas = new HashMap<String,Object>();
//System.out.println(request.getSession().getServletContext().getAttribute("userCount"));
		datas.put("checkID", idCardService.waitedForCheck());
		datas.put("loanUser", loanService.findCountByCondition("user"));
		datas.put("invUser", investService.getInvestUserCount());
		datas.put("allUser",userService.getAllUserCount());
		
		datas.put("invCount", investService.getInvestCount());
		datas.put("invMoney", investService.getTotlInvestMoney());
		datas.put("invingCount", investService.getInvestingCount());
		datas.put("invedCount", investService.getInvestedCount());
		
		datas.put("loanCount", loanService.findCountByCondition("total"));
		datas.put("loanMoney", loanService.findTotLoanMoney());
		datas.put("loanedCount", loanService.findCountByCondition("finished"));
		datas.put("checkingCount", loanService.findCountByCondition("checking"));
		datas.put("financing", loanService.findCountByCondition("financing"));
		datas.put("failed", loanService.findCountByCondition("failed"));
		datas.put("repaying", loanService.findCountByCondition("repaying"));
		
		datas.put("requiredCount", repayementService.getCountByCondition("required"));
		datas.put("finishedRepay", repayementService.getCountByCondition("finished"));
		datas.put("reqReMoney", repayementService.requiredRepayMoney());
		//datas.put("expired", repayementService.getCountByCondition("expired"));
		
		request.getSession().setAttribute("datas", datas);
		
		try {
			response.sendRedirect("admin/adminIndex.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}


	private void updateIDCardStatus(HttpServletRequest request,
			HttpServletResponse response) {
			String id  = request.getParameter("id");
			String status = request.getParameter("status");
			if(id!=null&&status!=null){
				
				if(status.equals("1")||status.equals("0")){
					
					idCardService.updateIDCardStatus(id,status);
				}
			}
	}


	private void getInvestUsers(HttpServletRequest request,
			HttpServletResponse response) {

		List<Invest> invests = null;
		PageUtil pg = new PageUtil(10, investService.getInvestCount());
		String strNum =  request.getParameter("pageNum");
		if(strNum!=null){
			int pageNum = Integer.parseInt(strNum);
			pg.setCurPage(pageNum);
		}else{
			pg.setCurPage(1);
		}
		invests = investService.findInvestsByPages(pg);
	
		//List<UserInfo> iUsers = new ArrayList<UserInfo>();
		Map<Integer,UserInfo> iUsers =  new HashMap<Integer,UserInfo>();
		UserInfo userInfo = null;
		for(Invest loan : invests){
			userInfo =userService.findUserInfoById(loan.getUserID());
			iUsers.put(userInfo.getUserID(), userInfo);
		}
		request.getSession().setAttribute("iUsers", iUsers);
		request.getSession().setAttribute("invests", invests);
		request.getSession().setAttribute("page", pg);
		try {
			response.sendRedirect("admin/invUserInfo.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}


	private void getIdCheckInfo(HttpServletRequest request,
			HttpServletResponse response) {
		PageUtil pg = new PageUtil(10,idCardService.findAllIdCardCount());
		String strNum =  request.getParameter("pageNum");
		if(strNum!=null){
			int pageNum = Integer.parseInt(strNum);
			pg.setCurPage(pageNum);
		}else{
			pg.setCurPage(1);
		}
			List<IDCardInfo> idInfos = idCardService.findIdCardInfosByPage(pg);
			request.getSession().setAttribute("idInfos", idInfos);
			request.getSession().setAttribute("page", pg);
			try {
				response.sendRedirect("admin/idCardInfo.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		
	}


	private void getInvestInfos(HttpServletRequest request,
			HttpServletResponse response) {
		
		PageUtil pg = new PageUtil(10,investService.getInvestCount());
		String strNum =  request.getParameter("pageNum");
		if(strNum!=null){
			int pageNum = Integer.parseInt(strNum);
			pg.setCurPage(pageNum);
		}else{
			pg.setCurPage(1);
		}
		
		List<Invest> invests = investService.findInvestsByPages(pg);
		request.getSession().setAttribute("invests", invests);
		request.getSession().setAttribute("page", pg);
		try {
			response.sendRedirect("admin/investInfo.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}


	private void getLoanInfos(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		PageUtil pg = new PageUtil(10,loanService.findLoanCount());
		String strNum =  request.getParameter("pageNum");
		if(strNum!=null){
			int pageNum = Integer.parseInt(strNum);
			pg.setCurPage(pageNum);
		}else{
			pg.setCurPage(1);
		}
		
		List<LoanInfo> loanInfos = loanService.findAllLoanInfo(pg.getCurPage(), pg.getRowsPrePage());
		
		request.getSession().setAttribute("loanInfos", loanInfos);
		request.getSession().setAttribute("page", pg);
		try {
			response.sendRedirect("admin/loanInfo.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	private void getUserInfos(HttpServletRequest request,
			HttpServletResponse response) {

		String strNum =  request.getParameter("pageNum");
		List<UserInfo> userInfos = null;
		PageUtil pg = new PageUtil(10, userService.getAllUserCount());
		if(strNum!=null){
			int pageNum = Integer.parseInt(strNum);
			pg.setCurPage(pageNum);
		}else{
			pg.setCurPage(1);
		}
		userInfos = userService.findUsersByPage(pg);
		request.getSession().setAttribute("userInfos", userInfos);
		request.getSession().setAttribute("page", pg);
		
		try {
			response.sendRedirect("admin/userInfo.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	private void loginHandle(HttpServletRequest request,
			HttpServletResponse response) {
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			ManagerInfo manager = managerService.checkManagerLogin(userName, password);
			if(manager!=null){
					try {
						response.sendRedirect("admin/index.jsp");
						request.getSession().setAttribute("admin", manager);
					} catch (IOException e) {
						e.printStackTrace();
					}
				
			}else{
				try {
					response.sendRedirect("admin/login.jsp");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
		
	}


	
	
	public void init() throws ServletException {
	}

}
