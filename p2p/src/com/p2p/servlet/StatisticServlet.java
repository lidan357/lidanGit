package com.p2p.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.p2p.bean.Interest;
import com.p2p.bean.LoanInfo;
import com.p2p.service.IDCardInfoService;
import com.p2p.service.InterestService;
import com.p2p.service.InvInterService;
import com.p2p.service.InvestService;
import com.p2p.service.LoanService;
import com.p2p.service.ManagerService;
import com.p2p.service.MorGoodsService;
import com.p2p.service.RepaymentService;
import com.p2p.service.UserInfoService;
import com.p2p.service.impl.IDCardInfoServiceImpl;
import com.p2p.service.impl.InterestServiceImpl;
import com.p2p.service.impl.InvInterServiceImpl;
import com.p2p.service.impl.InvestServiceImpl;
import com.p2p.service.impl.LoanServiceImpl;
import com.p2p.service.impl.ManagerServiceImpl;
import com.p2p.service.impl.MorGoodsServiceImpl;
import com.p2p.service.impl.RepaymentServiceImpl;
import com.p2p.service.impl.UserInfoServiceImpl;

public class StatisticServlet extends HttpServlet {
	private ManagerService managerService = new ManagerServiceImpl();
	private LoanService loanService = new LoanServiceImpl();
	private UserInfoService userService = new UserInfoServiceImpl();
	private InvestService investService = new InvestServiceImpl();
	private InterestService interestService = new InterestServiceImpl();
	private InvInterService invInterService =  new InvInterServiceImpl();
	private MorGoodsService morGoodsService =new MorGoodsServiceImpl();
	private RepaymentService repayementService = new RepaymentServiceImpl();
	private IDCardInfoService idCardService = new IDCardInfoServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String op=request.getParameter("op");
			if(op!=null&&op.equals("realTime")){
				getRealTimeJson(request,response);
			}else if(op!=null&&op.equals("getWeek")){
				getWeek(request,response);
			}else if(op!=null&&op.equals("aveComplete")){
				getaveComplete(request,response);
			}else if(op!=null&&op.equals("userComp")){
				getUserComp(request,response);
			}else if(op!=null&&op.equals("monthRe")){
				getMonthRe(request,response);
			}
			

	}


	private void getMonthRe(HttpServletRequest request,
			HttpServletResponse response) {
		
	}


	private void getUserComp(HttpServletRequest request,
			HttpServletResponse response) {
		JSONArray userComp = loanService.findStatistic("userComp");
		
		try {
			response.getWriter().println(userComp);
			response.getWriter().flush();
			response.getWriter().close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}


	private void getWeek(HttpServletRequest request,
			HttpServletResponse response) {
		JSONArray recentlyWeekLoanMoney = loanService.findStatistic("weekLoanMoney2");
		try {
			response.getWriter().println(recentlyWeekLoanMoney);
			response.getWriter().flush();
			response.getWriter().close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}


	private void getaveComplete(HttpServletRequest request,
			HttpServletResponse response) {
		JSONArray aveCompleteTime = loanService.findStatistic("aveComplete");
		try {
			response.getWriter().println(aveCompleteTime);
			response.getWriter().flush();
			response.getWriter().close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	private void getRealTimeJson(HttpServletRequest request,
			HttpServletResponse response) {
			Float totalDealMoney =
					interestService.findRepayedInter()+repayementService.findRepayedRepay();
			Float totalInvInter  =  invInterService.findGotInterest();
			Float waitRepay =(float) interestService.findWaitRepayInter()+repayementService.findWaitRepayMoney();
			JSONArray dealMoneyOfMonth = loanService.findStatistic("monthDeal");
			JSONArray loanBalance = loanService.findStatistic("loanBalance");
		//	JSONArray recentlyWeekLoanMoney = loanService.findStatistic("weekLoanMoney2");
	//		JSONArray aveCompleteTime = loanService.findStatistic("aveComplete");
			JSONArray monthUserCount = loanService.findStatistic("monthUserCount");
			int userCount = userService.getAllUserCount();
			float avUserInv = investService.findAverUserInvest();
			float avItemInv = investService.findAverItemInvest();
			int loanUserCount = loanService.findLoanUserCount();
			float avUserLoan = loanService.findAverUserLoan();
			float avItemLoan = loanService.findAverItemLoan();
			float loanBalanceMoney = repayementService.findWaitRepayMoney();
			float expireRate =(float) interestService.findExpireMoney()/totalDealMoney*100.0f;
			List<Interest> monthRe =  interestService.findMonthRe();
			Map<Integer,LoanInfo> loanInfos = new HashMap<Integer,LoanInfo>();
			for(Interest inter : monthRe){
				loanInfos.put(inter.getLoanID(), loanService.findLoanInfoById(inter.getLoanID()));
			}
			
			List<Interest> expireNo=  interestService.findExpireNo();//逾期但是还没还的
			Map<Integer,LoanInfo> expireLoan = new HashMap<Integer,LoanInfo>();
			for(Interest inter : expireNo){
				expireLoan.put(inter.getLoanID(), loanService.findLoanInfoById(inter.getLoanID()));
			}
			
			List<Interest> expireRe=  interestService.findExpireRe();//逾期但是已经还了的
			Map<Integer,LoanInfo> expireReLoan = new HashMap<Integer,LoanInfo>();
			for(Interest inter : expireRe){
				expireReLoan.put(inter.getLoanID(), loanService.findLoanInfoById(inter.getLoanID()));
			}
			
			
			try {
				request.setAttribute("totalDealMoney", totalDealMoney);
				request.setAttribute("totalInvInter", totalInvInter);
				request.setAttribute("waitRepay", waitRepay);
				request.setAttribute("dealMoneyOfMonth", dealMoneyOfMonth);
				request.setAttribute("loanBalance", loanBalance);
			//request.setAttribute("week", recentlyWeekLoanMoney);
				//request.getSession().setAttribute("week", recentlyWeekLoanMoney);
				request.setAttribute("monthUserCount", monthUserCount);
		//		request.setAttribute("aveCompleteTime", aveCompleteTime);
				request.setAttribute("userCount", userCount);
				request.setAttribute("avUserInv", avUserInv);
				request.setAttribute("avItemInv", avItemInv);
				request.setAttribute("loanUserCount", loanUserCount);
				request.setAttribute("avUserLoan", avUserLoan);
				request.setAttribute("avItemLoan", avItemLoan);
				request.setAttribute("loanBalanceMoney", loanBalanceMoney);
				request.setAttribute("expireRate", expireRate);
				request.setAttribute("monthRe", monthRe);
				request.setAttribute("loanInfos", loanInfos);
				request.setAttribute("expireNo", expireNo);
				request.setAttribute("expireLoan", expireLoan);
				request.setAttribute("expireRe", expireRe);
				request.setAttribute("expireReLoan", expireReLoan);
				
				request.getRequestDispatcher("realTimeStatistic.jsp").forward(request, response);;
				
			} catch ( ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
