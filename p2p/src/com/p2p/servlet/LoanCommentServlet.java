package com.p2p.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.UserInfo;
import com.p2p.service.LoanCommService;
import com.p2p.service.impl.LoanCommServiceImpl;

public class LoanCommentServlet extends HttpServlet {
	private LoanCommService loanCommService = new LoanCommServiceImpl();

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
		
		String op= request.getParameter("op");
		if(op!=null&&op.equals("addComm")){
			addComment(request,response);
			
			
		}
				
		
		

	}

	private void addComment(HttpServletRequest request,
			HttpServletResponse response) {
			String content =  request.getParameter("content");
			UserInfo user = (UserInfo)request.getSession().getAttribute("user");
			String strLid =request.getParameter("lid");
			int lid = -1;
			int uid = -1;
			if(user!=null){
				uid = user.getUserID();
			}
			if(strLid!=null){
				lid = Integer.parseInt(strLid);
			}
			if(lid!=-1&&uid!=-1&&content!=null){
				loanCommService.addComment(lid,uid,content);
				
			}
			
			
			
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
