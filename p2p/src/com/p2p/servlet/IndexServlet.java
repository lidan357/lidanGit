package com.p2p.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.LoanInfo;
import com.p2p.bean.UserAllMoney;
import com.p2p.bean.UserInfo;
import com.p2p.service.impl.LoanServiceImpl;
import com.p2p.util.DateUtil;


public class IndexServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String key = req.getParameter("op");
		if(key.equals("show")){
			//new对象
			LoanServiceImpl service = new LoanServiceImpl();
			List<LoanInfo> listoffreshman=new ArrayList<LoanInfo>();
			List<LoanInfo> listofexperience =new ArrayList<LoanInfo>();
			List<LoanInfo> listofFiveLoanInfo = new ArrayList<LoanInfo>();
			int SUMcurMoney,SUMloanMoney,UserAllnumber;
			List<UserAllMoney> listofFiveUserAllMoney = new ArrayList<UserAllMoney>();
			//数据得到
			Long days = DateUtil.daysBetween();
			SUMcurMoney=service.getSUMcurMoney();
			SUMloanMoney=service.getSUMloanMoney();
			UserAllnumber=service.getUserAllnumber();
			listoffreshman = service.findByLoanType("新手");
			listofexperience = service.findByLoanType("体验");
			listofFiveLoanInfo = service.getFiveLoanInfo(0, 5);
			listofFiveUserAllMoney = service.getFiveUserAllMoney();
			System.out.println(listofFiveUserAllMoney.size());
			System.out.println(listofFiveLoanInfo.size());
			System.out.println(listoffreshman.size());
			System.out.println(listofexperience.size());
			//数据转送
			req.setAttribute("listofFiveUserAllMoney", listofFiveUserAllMoney);
			req.setAttribute("listofFiveLoanInfo", listofFiveLoanInfo);
			req.setAttribute("listoffreshman", listoffreshman);
			req.setAttribute("listofexperience", listofexperience);
			req.setAttribute("days", days);
			req.setAttribute("SUMcurMoney", SUMcurMoney);
			req.setAttribute("SUMloanMoney", SUMloanMoney);
			req.setAttribute("UserAllnumber", UserAllnumber);
			req.setAttribute("user", req.getSession().getAttribute("user"));
			req.getRequestDispatcher("index.jsp").forward(req,resp);	
		}	
	}
}
