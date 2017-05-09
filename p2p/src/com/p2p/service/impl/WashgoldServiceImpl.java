package com.p2p.service.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.p2p.bean.UserInfo;
import com.p2p.bean.Washgold;
import com.p2p.dao.InvestDao;
import com.p2p.dao.UserInfoDao;
import com.p2p.dao.WashgoldDao;
import com.p2p.dao.impl.InvestDaoImpl;
import com.p2p.dao.impl.UserInfoDaoImpl;
import com.p2p.dao.impl.WashgoldDaoImpl;
import com.p2p.util.DbUtil;

public class WashgoldServiceImpl {
	WashgoldDao washDao = new WashgoldDaoImpl();
	InvestDao investDao = new InvestDaoImpl();
	UserInfoDao userDao=new UserInfoDaoImpl();

	public List<Washgold> getWashgolds(int userID, Date date) {
		/* List<Washgold> list=new ArrayList<Washgold>(); */
		List<Washgold> list = washDao.findWashgoldByUserIDandDate(userID, date);
		

		if (list.size()==0||list==null) {
			Map<Integer, Integer> map = new HashMap<Integer, Integer>();
			map.put(1, 18);
			map.put(2, 38);
			map.put(3, 58);
			map.put(4, 88);
			map.put(5, 118);
			Washgold washgold = new Washgold();
			washgold.setUserID(userID);
			washgold.setWashDate(date);
			for (int i = 1; i <= 5; i++) {
				washgold.setRank(i);
				washgold.setGetMoney(map.get(i));
				washgold.setIsFull("否");
				boolean bool=washDao.addWashgold(washgold);
				System.out.println(bool);
				
			}
			list = washDao.findWashgoldByUserIDandDate(userID, date);
			
		}
		return list;
	}
	
	public List<Washgold> updateWashgoldsByTodayMoney(List<Washgold> list,float todayMoney){
		if (todayMoney < 10000) {
			
		} else if (todayMoney < 20000) {
			list.get(0).setIsFull("是");
		} else if (todayMoney < 30000) {
			list.get(0).setIsFull("是");
			list.get(1).setIsFull("是");
		} else if (todayMoney < 50000) {
			list.get(0).setIsFull("是");
			list.get(1).setIsFull("是");
			list.get(2).setIsFull("是");
		} else if (todayMoney < 100000) {
			list.get(0).setIsFull("是");
			list.get(1).setIsFull("是");
			list.get(2).setIsFull("是");
			list.get(3).setIsFull("是");
		}else if(todayMoney > 100000){
			list.get(0).setIsFull("是");
			list.get(1).setIsFull("是");
			list.get(2).setIsFull("是");
			list.get(3).setIsFull("是");
			list.get(4).setIsFull("是");
		}
		washDao.updateWashgold(list.get(0));
		washDao.updateWashgold(list.get(1));
		washDao.updateWashgold(list.get(2));
		washDao.updateWashgold(list.get(3));
		washDao.updateWashgold(list.get(4));
		return list;
	}

	public boolean  updateGet(int washID) {
		boolean bool=false;
		Connection conn = DbUtil.getConnetion();
		try {
			conn.setAutoCommit(false);
			Washgold washgold=washDao.findWashgoldByWashID(washID);
			washgold.setIsGet("是");
			washDao.updateWashgold(washgold);
			UserInfo userInfo = userDao.findUserInfo(washgold.getUserID());
			userInfo.setRedPacket(userInfo.getRedPacket()+washgold.getGetMoney());
			userDao.updateRedpacket(userInfo);
			conn.commit();
			bool=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bool;		
	}
}
