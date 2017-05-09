package com.p2p.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.p2p.bean.UserInfo;
import com.p2p.bean.Washgold;
import com.p2p.dao.WashgoldDao;
import com.p2p.dao.impl.WashgoldDaoImpl;
import com.p2p.service.UserInfoService;
import com.p2p.service.impl.InvestServiceImpl;
import com.p2p.service.impl.UserInfoServiceImpl;
import com.p2p.service.impl.WashgoldServiceImpl;

public class WashgoldServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String op=req.getParameter("op");
		Date date=new Date(System.currentTimeMillis());
		UserInfo user = (UserInfo) req.getSession().getAttribute("user");
		WashgoldServiceImpl washSer=new WashgoldServiceImpl();
		UserInfoService userSer=new UserInfoServiceImpl();
		ObjectMapper mapper=new ObjectMapper();
		
		if(op==null){
			if (user != null) {
				int userID=user.getUserID();				
				float money = new InvestServiceImpl().getMoneyByUserandDate(userID,date);
				float disMoney = disMoney(money);							
				List<Washgold> washgolds = washSer.getWashgolds(userID, date);
				System.out.println(washgolds);
				washgolds=washSer.updateWashgoldsByTodayMoney(washgolds, money);
				req.setAttribute("money", money);
				req.setAttribute("disMoney", disMoney);
				req.setAttribute("washgolds", washgolds);
			}
			req.getRequestDispatcher("/washgold.jsp").forward(req, resp);
		}else if(op.equals("get")){
			int washID = Integer.parseInt(req.getParameter("washID"));
			boolean bool=washSer.updateGet(washID);		
			String data = mapper.writeValueAsString(bool);
			resp.getWriter().write(data);			
		}else if(op.equals("login")){
			String loginName=req.getParameter("user_name");
			String password=req.getParameter("pass_word");
			System.out.println(loginName+":"+password);
			UserInfo userInfo = userSer.checkLogin(loginName, password);
			if(userInfo!=null){
				req.getSession().setAttribute("user", userInfo);
				resp.getWriter().write("true");
			}else{
				resp.getWriter().write("false");
			}		
		}	
	}

	public float disMoney(float money) {
		float disMoney = 0;
		if (money < 10000) {
			disMoney = 10000 - money;
		} else if (money < 20000) {
			disMoney = 20000 - money;
		} else if (money < 30000) {
			disMoney = 30000 - money;
		} else if (money < 50000) {
			disMoney = 50000 - money;
		} else if (money < 100000) {
			disMoney = 100000 - money;
		}
		return disMoney;
	}

}
