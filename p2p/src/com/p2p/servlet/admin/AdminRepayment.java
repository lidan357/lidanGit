package com.p2p.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.Repayment;
import com.p2p.service.RepaymentService;
import com.p2p.service.impl.RepaymentServiceImpl;
import com.p2p.util.PageUtil;

public class AdminRepayment extends HttpServlet {
	private RepaymentService  repayService = new RepaymentServiceImpl();

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log

	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String op = request.getParameter("op");
			if(op!=null&&op.equals("repayInfo")){
				
				getRepayInfos(request,response);
			}
		
	}

	
	private void getRepayInfos(HttpServletRequest request,
			HttpServletResponse response) {
		
		PageUtil pg = new PageUtil(10,repayService.findAllRepayMentsCount());
		String strNum =  request.getParameter("pageNum");
		if(strNum!=null){
			int pageNum = Integer.parseInt(strNum);
			pg.setCurPage(pageNum);
		}else{
			pg.setCurPage(1);
		}
		
			List<Repayment> repayment = repayService.findRepayMentsByPage(pg);
			request.getSession().setAttribute("repayments", repayment);
			request.getSession().setAttribute("page", pg);
			try {
				response.sendRedirect("admin/repayInfo.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		
		
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
