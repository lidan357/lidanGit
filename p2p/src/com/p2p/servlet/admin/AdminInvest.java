package com.p2p.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.Invest;
import com.p2p.service.InvestService;
import com.p2p.service.impl.InvestServiceImpl;
import com.p2p.util.PageUtil;

public class AdminInvest extends HttpServlet {
	private InvestService investService  = new InvestServiceImpl();
	
	public AdminInvest() {
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
			String op=request.getParameter("op");
			if(op!=null&&op.equals("investing")){
				
				getInvestingInfos(request,response);
			}else if(op!=null&&op.equals("invested")){
				getInvestedInfos(request,response);
				
				
			}
				
		
		
		
		
	}

	private void getInvestedInfos(HttpServletRequest request,
			HttpServletResponse response) {
		PageUtil pg = new PageUtil(10,investService.getInvestCount());
		String strNum =  request.getParameter("pageNum");
		if(strNum!=null){
			int pageNum = Integer.parseInt(strNum);
			pg.setCurPage(pageNum);
		}else{
			pg.setCurPage(1);
		}
		List<Invest> invests =  investService.findInvestsByPages(pg);
		request.getSession().setAttribute("invests", invests);
		request.getSession().setAttribute("page", pg);
		try {
			response.sendRedirect("admin/invested.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void getInvestingInfos(HttpServletRequest request,
			HttpServletResponse response) {
		PageUtil pg = new PageUtil(10,investService.getInvestCount());
		String strNum =  request.getParameter("pageNum");
		if(strNum!=null){
			int pageNum = Integer.parseInt(strNum);
			pg.setCurPage(pageNum);
		}else{
			pg.setCurPage(1);
		}
		List<Invest> invests =  investService.findInvestsByPages(pg);
			request.getSession().setAttribute("invests", invests);
			request.getSession().setAttribute("page", pg);
			try {
				response.sendRedirect("admin/investing.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		
	}

	public void init() throws ServletException {
	}

}
