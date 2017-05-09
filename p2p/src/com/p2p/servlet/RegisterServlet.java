package com.p2p.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.UserInfo;
import com.p2p.service.UserInfoService;
import com.p2p.service.impl.UserInfoServiceImpl;

public class RegisterServlet extends HttpServlet{
		private UserInfoService userInfoService = new UserInfoServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			String op = req.getParameter("op");
			if(op!=null){
				checkUserInfo(op,req,resp);
			}else{
				String userName=req.getParameter("userName");
				String password=req.getParameter("password");
				String phone = req.getParameter("phone");
				UserInfo userInfo = null;
				if(userName==null||password==null||phone==null){
					return;
				}else{
					userInfo = new UserInfo(userName,password,phone);
					userInfo.setStatus("否");
					boolean result = userInfoService.addUser(userInfo);
					if(result){
							req.getSession().setAttribute("action", "register");
							
							resp.sendRedirect("skip.jsp");
					}else{
						resp.sendRedirect("register.jsp");
					}
				}
				
			}
	}

	//检查用户名和电话号码是否已经存在
	private void checkUserInfo(String op,HttpServletRequest req, HttpServletResponse resp) {
		boolean result = false;	
		if(op.equals("checkName")){
			
			String userName = req.getParameter("userName");
			result=userInfoService.isUserExits(userName, null);
			
		}else if( op.equals("checkPhone")){
			String phone = req.getParameter("phone");
			 result = userInfoService.isUserExits(null, phone);
		}
			try {
				if(result){
				resp.getWriter().write("1");//代表存在此用户
				}else{
					resp.getWriter().write("0");//代表不存在此用户
				}
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				try {
					resp.getWriter().flush();
					resp.getWriter().close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
		
	}

}
