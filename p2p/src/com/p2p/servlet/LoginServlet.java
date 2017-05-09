package com.p2p.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.UserInfo;
import com.p2p.service.UserInfoService;
import com.p2p.service.impl.UserInfoServiceImpl;
import com.p2p.util.LoginUtils;

public class LoginServlet extends HttpServlet{
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
			if(op!=null&&op.equals("exit")){//处理用户退出登录
				req.getSession().removeAttribute("user");
				int userCount = (int)req.getSession().getServletContext().getAttribute("userCount");
				userCount-=1;
				req.getSession().getServletContext().setAttribute("userCount", userCount);
				return ;
			}
			String loginName=req.getParameter("loginName");
			String password=req.getParameter("password");
			UserInfo userInfo = null;
			if(loginName==null||password==null){
				resp.sendRedirect("login.jsp");
			}else{
				userInfo = userInfoService.checkLogin(loginName,password);
				if(userInfo!=null){
				LoginUtils.createCookie(req, resp);
				req.getSession().setAttribute("user", userInfo);
				
				req.getSession().removeAttribute("error");
				int userCount=0;
				Object strCount =  req.getSession().getServletContext().getAttribute("userCount");
				if(strCount!=null){
					userCount=(Integer)strCount;
					userCount++;
				}else{
					userCount=1;
				}
				req.getSession().getServletContext().setAttribute("userCount", userCount);
				resp.sendRedirect("IndexServlet.action?op=show");
				}else{
					req.getSession().setAttribute("error", "用户名或者密码错误");
					resp.sendRedirect("login.jsp");
					
				}
			}
	}

}
