package com.p2p.servlet;
//存入奖励金额
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.Award;
import com.p2p.bean.UserInfo;
import com.p2p.dao.impl.AwardDaoImpl;
import com.p2p.dao.impl.UserInfoDaoImpl;

public class AwardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String awdMoney = req.getParameter("awdMoney");
		awdMoney = new String(awdMoney.getBytes("ISO8859-1"),"utf-8");
		//System.out.println(awdMoney);
		int money = Integer.parseInt(awdMoney.substring(0, awdMoney.length()-1));
		//System.out.println(money);
		
		UserInfo user =(UserInfo) req.getSession().getAttribute("user");
		int userID = user.getUserID();
		//修改award表
		AwardDaoImpl adi = new AwardDaoImpl();
		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		Award award = adi.findAward(userID, date);
		money = award.getAwdMoney() + money;
		award.setAwdMoney(money);
		adi.update(award);
		//修改用户表的红包金额
		UserInfoDaoImpl uidi = new UserInfoDaoImpl();
		float redPacket = user.getRedPacket() + money;
		user.setRedPacket(redPacket);
		uidi.updateRedpacket(user);
	}

}
