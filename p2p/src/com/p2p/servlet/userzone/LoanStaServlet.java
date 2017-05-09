package com.p2p.servlet.userzone;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.LoanInfo;
import com.p2p.bean.UserInfo;
import com.p2p.service.impl.LoanServiceImpl;

public class LoanStaServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				LoanServiceImpl loanSer=new LoanServiceImpl();
				UserInfo user= (UserInfo) req.getSession().getAttribute("user");
				
				List<LoanInfo> loanInfos= loanSer.findLoanInfoByUserID(user.getUserID());
				//System.out.println(loanInfos);
				req.setAttribute("loanInfos", loanInfos);
				req.getRequestDispatcher("/userzone/loanSta.jsp").forward(req, resp);
	}
	
}
