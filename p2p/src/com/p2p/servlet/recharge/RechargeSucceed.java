package com.p2p.servlet.recharge;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.UserInfo;
import com.p2p.service.impl.UserInfoServiceImpl;

public class RechargeSucceed extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				float money=Float.parseFloat((String)req.getSession().getAttribute("money"));
				UserInfo user = (UserInfo) req.getSession().getAttribute("user");
				user.setBalance(user.getBalance()+money);
				UserInfoServiceImpl userSer=new UserInfoServiceImpl();
				userSer.updateUserInfo(user);
				resp.sendRedirect("/p2p/welcome.jsp");
				
	}
	
}
