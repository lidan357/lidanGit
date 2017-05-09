package com.p2p.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.Award;
import com.p2p.bean.UserInfo;
import com.p2p.dao.impl.AwardDaoImpl;

//获取抽奖次数
public class GetAwardServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//在返回服务器结果之前需要设置：response.setContentType("text/html");
		resp.setContentType("text/html");
		AwardDaoImpl adi = new AwardDaoImpl();
		UserInfo user = (UserInfo) req.getSession().getAttribute("user");
		int userID = user.getUserID();
		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		Award award = adi.findAward(userID, date);
		if(award!=null){
			int times = award.getTimes();
			System.out.println(times);
			if(times>0){
				int newTime = times-1;
				award.setTimes(newTime);
				adi.update(award);
				//req.setAttribute("times", times);
				resp.getOutputStream().write(times);
			}else{
				resp.getOutputStream().write("0".getBytes());
			}
		} else{
			//req.setAttribute("times", "抽奖前请先登录！");
			resp.getOutputStream().write("-1".getBytes());
		}
	}

}
