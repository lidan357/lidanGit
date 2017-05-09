package com.p2p.servlet.userzone;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.UserInfo;
import com.p2p.dao.impl.InvestDaoImpl;
import com.p2p.dao.impl.LoanInfoDaoImpl;

public class HomePageServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserInfo user = (UserInfo) req.getSession().getAttribute("user");
		int userID = user.getUserID();
	
		LoanInfoDaoImpl ld= new LoanInfoDaoImpl();
		int loanRecords = ld.userCount(userID);
		int loanMoneys = ld.getSUMloanMoneyByUser(userID);
		InvestDaoImpl ii = new InvestDaoImpl();
		int invRecords = ii.userCount(userID);
		int invMoneys = ii.getSUMinvMoneyByUser(userID);
		req.setAttribute("user",user);
		req.setAttribute("loanRecords",loanRecords);
		req.setAttribute("loanMoneys",loanMoneys);
		req.setAttribute("invRecords",invRecords);
		req.setAttribute("invMoneys",invMoneys);
		req.getRequestDispatcher("/userzone/homePage.jsp").forward(req, resp);
		
	}
	

}
