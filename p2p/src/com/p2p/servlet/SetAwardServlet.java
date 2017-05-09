package com.p2p.servlet;
//设置抽奖次数
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.Award;
import com.p2p.bean.UserInfo;
import com.p2p.dao.impl.AwardDaoImpl;
import com.p2p.dao.impl.UserInfoDaoImpl;

public class SetAwardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取登录的用户名
		String userName = req.getParameter("userName");
		if(userName!=null){
			userName = new String(userName.getBytes("ISO8859-1"),"utf-8");
			//System.out.println(userName);
			//查询该登录名的用户ID
			UserInfoDaoImpl uid = new UserInfoDaoImpl();
			UserInfo userInfo = uid.findUserInfo(userName, null);
			int userID = userInfo.getUserID();
			//通过用户ID和日期来获取该用户当天的抽奖信息
			AwardDaoImpl adi = new AwardDaoImpl();
			java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
			//System.out.println(date);
			Award award = adi.findAward(userID, date);
			//System.out.println(award);
			
			//该用户当天的抽奖信息不存在则创建
			if(award==null){
				award = new Award();
				award.setUserID(userID);
				award.setAwdDate(date);
				award.setTimes(1);
				adi.add(award);	
			}
		}
		
	}

}
