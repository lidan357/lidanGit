package com.p2p.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.UserInfo;
import com.p2p.service.UserInfoService;
import com.p2p.service.impl.UserInfoServiceImpl;
import com.p2p.util.MD5keyBean;

public class PasswordServlet extends HttpServlet {
	private UserInfoService userInfoService = new UserInfoServiceImpl();
	
	public PasswordServlet() {
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
		String op = request.getParameter("op");
		if(op!=null&&op.equals("updatePwd")){//修改好的密码
			updatePwd(request,response);
			
		}else if(op==null){//跳转到修改密码的页面
			
			String captchaIsRight= (String)request.getSession().getAttribute("captchaIsRight");
					if(captchaIsRight==null||!captchaIsRight.equals("true")){
						try {
							response.sendRedirect("findPwd.jsp");//验证码不正确 就直接放回
						} catch (IOException e) {
							e.printStackTrace();
						}
					}else{
						String phone = request.getParameter("user_phone");
						request.getSession().setAttribute("phone", phone);
						response.sendRedirect("resetPwd.jsp");
					}
					
					
		}else if (op!=null&&op.equals("checkPwd")){
			
			checkPassword(request,response);
		}
	}

	private void checkPassword(HttpServletRequest request,
			HttpServletResponse response) {
		MD5keyBean md5 = new MD5keyBean();
		String password =  request.getParameter("password");
		UserInfo userInfo =(UserInfo) request.getSession().getAttribute("user");
		if(password!=null&&!password.equals("")){
				password = md5.getkeyBeanofStr(password);
			
		}
		try {
			if(userInfo!=null&&password.equals(userInfo.getPassword())){
				response.getWriter().write("1");
				
			}else{
				response.getWriter().write("0");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	private void updatePwd(HttpServletRequest req, HttpServletResponse resp) {
		
		String newPwd =  req.getParameter("password");		
		//String userName = req.getParameter("userName");
		String phone =(String) req.getSession().getAttribute("phone");
		if(newPwd!=null&&phone!=null){
			userInfoService.updatePassword(phone,newPwd);
			req.getSession().setAttribute("action","findPwd");
			try {
				resp.sendRedirect("success.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public void init() throws ServletException {
	
	}

}
