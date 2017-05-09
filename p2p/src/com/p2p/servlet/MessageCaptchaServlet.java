package com.p2p.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.util.RandomCaptcha;
import com.p2p.util.SendMsgUtil;

public class MessageCaptchaServlet extends HttpServlet {
	public MessageCaptchaServlet() {
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
			String strCap =  request.getParameter("captcha");
			if(strCap==null){
				sendCaptcha(request, response);
			}else{
				checkCpatcha(strCap,request, response);
				
			}
	}

	public void init() throws ServletException {
		// Put your code here
	}

	public void sendCaptcha(HttpServletRequest request, HttpServletResponse response){
		
		String captcha  = RandomCaptcha.getCaptcha();
		String op = request.getParameter("op");
		String phone = request.getParameter("phone");
		String content="";
		if(op!=null&&op.equals("findPwd")){
			content="【中鑫P2P】您找回密码的验证码为"+captcha+"，请于5分钟内正确输入验证码";
		}if(op!=null&&op.equals("register")){
			content ="【中鑫P2P】您注册中鑫网站的验证码为"+captcha+"，请于5分钟内正确输入验证码";
		}
System.out.println(captcha);
		
		SendMsgUtil.sendMsg(phone, content);
		request.getSession().removeAttribute("captcha");
		request.getSession().setAttribute("captcha", captcha);
		
	}
	
	public void checkCpatcha(String strCap,HttpServletRequest request, HttpServletResponse response){
		
		String op = request.getParameter("op");
		if(op!=null&&op.equals("register")||op.equals("findPwd")){//
			try {
				if(strCap.equals(request.getSession().getAttribute("captcha"))){
					response.getWriter().write("1");//返回1 代表验证匹配正确
					request.getSession().setAttribute("captchaIsRight", "true");
				}else{
					response.getWriter().write("0");//返回0 代表验证匹配正确
				}
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
				}
			}/*else if(op!=null&&op.equals("findPwd")){//找回密码
			
				try {
					if(strCap.equals(request.getSession().getAttribute("captcha"))){
						request.getSession().setAttribute("captcha", "1");				
						response.sendRedirect("");
					}else{
						response.sendRedirect("");
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}*/
				
	}
	
	
}
