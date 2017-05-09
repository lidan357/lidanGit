package com.p2p.servlet.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.p2p.util.ExcelFileGenerator;
import com.p2p.bean.IDCardInfo;
import com.p2p.bean.LoanInfo;
import com.p2p.bean.MorGoods;
import com.p2p.bean.UserInfo;
import com.p2p.service.IDCardInfoService;
import com.p2p.service.LoanService;
import com.p2p.service.MorGoodsService;
import com.p2p.service.UserInfoService;
import com.p2p.service.impl.IDCardInfoServiceImpl;
import com.p2p.service.impl.LoanServiceImpl;
import com.p2p.service.impl.MorGoodsServiceImpl;
import com.p2p.service.impl.UserInfoServiceImpl;

public class LoanInfoServlet extends HttpServlet {
	private LoanService loanService = new LoanServiceImpl();
	private UserInfoService userService = new UserInfoServiceImpl();
	private MorGoodsService morGoodsService =new MorGoodsServiceImpl();
	private IDCardInfoService idCardService = new IDCardInfoServiceImpl();
	//public  static List<LoanInfo> infos = new ArrayList<LoanInfo>();
	public LoanInfoServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op =request.getParameter("op");
		if(op!=null&&op.equals("loanDetail")){
			
			getLoanDetail(request,response);
			
		}else if(op!=null&&op.equals("check")){
			
			checkLoanStatus(request,response);
			
			
		}else if(op!=null&&op.equals("waitAppr")){
			
			getWaitApprLoanInfos(request,response);
		}else if(op!=null&&op.equals("getFailed")){
			
			getFailedLoanInfos(request,response);
			
		}else if(op!=null&&op.equals("exportExcel")){
			
			exportLoanInfos(request,response);
			
		}
		
	}

	private void exportLoanInfos(HttpServletRequest request,
			HttpServletResponse response) {
		ExcelFileGenerator excel =loanService.getExcel(); 
		OutputStream out=null;
 		try {
			 out = response.getOutputStream();
			// out = new FileOutputStream("E://a.xls");
			response.reset();
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition", "attachment; filename=file.xls");
			excel.expordExcel(out);
			System.setOut(new PrintStream(out));
			out.flush();
			
		} catch (IOException e) {

			e.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
		}finally{
			
			if(out!=null){
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	private void getFailedLoanInfos(HttpServletRequest request,
			HttpServletResponse response) {
			JSONArray json = loanService.getFailedLoanInfos();
			try {
				response.getWriter().println(json);
System.out.println(json);
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {

				e.printStackTrace();
			}
			
		
	}

	private void getWaitApprLoanInfos(HttpServletRequest request,
			HttpServletResponse response) {
			
		JSONArray json = loanService.findWaitApprLoanInfos();
		
		try {
			response.getWriter().println(json);
			System.out.println(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {

			e.printStackTrace();
		}
		
		
	}

	private void checkLoanStatus(HttpServletRequest request,
			HttpServletResponse response) {
		String status = request.getParameter("value");
		String loanId = request.getParameter("loanId");
		List<LoanInfo> infos = loanService.findAllLoanInfo();
		
		int lid = -1;
		if(loanId!=null){
			lid = Integer.parseInt(loanId);
		}
		if(status!=null&&lid!=-1){
			loanService.updateStatus(lid,status);
		}
		try {
			request.getSession().removeAttribute("loanInfos");
			request.getSession().setAttribute("loanInfos", infos);
			response.sendRedirect(request.getContextPath()+"/admin.action?op=loanInfo");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void getLoanDetail(HttpServletRequest request,
			HttpServletResponse response) {
			String lid = request.getParameter("loanId");
			int loanId = -1;
			if(lid!=null){
				loanId = Integer.parseInt(lid);
			}
			
			LoanInfo loanInfo = loanService.findLoanInfoById(loanId);
			UserInfo userInfo =null;
			IDCardInfo cardInfo = null;
			MorGoods mg = null;
			
			if(loanInfo!=null){
				userInfo = userService.findUserInfoById(loanInfo.getUserID());
				cardInfo = idCardService.findByUserId(userInfo.getUserID());
				mg = morGoodsService.findMorGoods(loanInfo.getLoanID());
			}
			
			int index= cardInfo.getCardPicWithH().indexOf("p2p");
			cardInfo.setCardPicWithH(cardInfo.getCardPicWithH().substring(index-1));
			int index2 = cardInfo.getCardPic().indexOf("p2p");
			cardInfo.setCardPic(cardInfo.getCardPic().substring(index2-1));
			mg.setRealPic(mg.getRealPic().substring(mg.getRealPic().indexOf("p2p")-1));
			request.setAttribute("loanInfo", loanInfo);
			request.setAttribute("userInfo", userInfo);
			request.setAttribute("cardInfo", cardInfo);
			request.setAttribute("mg", mg);
			try {
				request.getRequestDispatcher("admin/loanDetail.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}

	public void init() throws ServletException {

	
	}

}
