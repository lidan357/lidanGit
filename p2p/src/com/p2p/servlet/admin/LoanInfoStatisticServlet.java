package com.p2p.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.p2p.service.LoanService;
import com.p2p.service.impl.LoanServiceImpl;

public class LoanInfoStatisticServlet extends HttpServlet {
	private LoanService loanService  = new LoanServiceImpl();

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
			String op=request.getParameter("op");
			JSONArray json= null;
			if(op!=null&&op.equals("weekLoanCount")){
				json = loanService.findStatistic("weekLoanCount");
				
			}else if(op!=null&&op.equals("weekLoanMoney")){
				json = loanService.findStatistic("weekLoanMoney");
				
			}else if(op!=null&&op.equals("check")){
				json = loanService.findStatistic("check");
				
			}else if(op!=null&&op.equals("inter")){
				json = loanService.findStatistic("inter");
				
			}else if(op!=null&&op.equals("userCount")){
				json = loanService.findStatistic("userCount");
				
			}else if(op!=null&&op.equals("interBubble")){
				json = loanService.findStatistic("interBubble");
				
			}else if(op!=null&&op.equals("loanAndInvest")){
				json = loanService.findStatistic("loanAndInvest");
			}
			try {
				response.getWriter().println(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}

	
	public void init() throws ServletException {
	
		
	}

}
