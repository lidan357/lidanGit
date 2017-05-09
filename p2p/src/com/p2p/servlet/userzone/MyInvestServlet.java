package com.p2p.servlet.userzone;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.Invest;
import com.p2p.bean.UserInfo;
import com.p2p.dao.impl.InvestDaoImpl;

public class MyInvestServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserInfo user = (UserInfo) req.getSession().getAttribute("user");
		int userID = user.getUserID();
		List<Invest> invests = new InvestDaoImpl().findInvestByUserID(userID);
		req.setAttribute("count", 1);
		req.setAttribute("invests",invests);
		req.getRequestDispatcher("/userzone/myInvest.jsp").forward(req, resp);
	}

}
