package com.p2p.servlet.userzone;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.p2p.bean.Interest;
import com.p2p.service.InterestService;
import com.p2p.service.impl.InterestServiceImpl;
import com.p2p.service.impl.RepaymentServiceImpl;

public class PayInterest extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String op=req.getParameter("op");
		String loanID=req.getParameter("loanID");
		ObjectMapper mapper=new ObjectMapper();
		if(op.equals("show")){		
			//System.out.println(loanID);
			InterestService intSer=new InterestServiceImpl();
			List<Interest>  lists= intSer.findInterestByLoanId(Integer.parseInt(loanID));			
			String data=mapper.writeValueAsString(lists);
			resp.getWriter().write(data);
		}else if(op.equals("payInterest")){
			String interID=req.getParameter("interID");
			Boolean bool=new InterestServiceImpl().payInterest(Integer.parseInt(interID));		
			String data=mapper.writeValueAsString(bool);
			resp.getWriter().write(data);
		}else if(op.equals("pay")){
			System.out.println(loanID);
			int loanId=Integer.parseInt(loanID);
			boolean bool=new RepaymentServiceImpl().repayment(loanId);
			String data=mapper.writeValueAsString(bool);
			resp.getWriter().write(data);
		}
		
		
	}
	
}
