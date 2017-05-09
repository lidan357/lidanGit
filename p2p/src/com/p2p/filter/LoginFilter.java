package com.p2p.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.UserInfo;

public class LoginFilter implements Filter{

	List<String> list = new ArrayList<String>();
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
			HttpServletRequest request = (HttpServletRequest)arg0;
			HttpServletResponse response = (HttpServletResponse)arg1;
			//String str1= request.getRemoteAddr();
			String path = request.getServletPath();
			UserInfo user =(UserInfo) request.getSession().getAttribute("user");
			if(list.contains(path)&&user==null){
				response.sendRedirect("/p2p/login.jsp");
			}else{
				arg2.doFilter(request, response);
			}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		list.add("/homePage.action");
		list.add("/pc.action");
		list.add("/userzone/userIdent.jsp");
		list.add("/userzone/recharge.jsp");
		list.add("/myInvest.action");
		list.add("/loanSta.action");
		list.add("/payInterest.action");
		list.add("/loanSta.action");
		
	}

}
