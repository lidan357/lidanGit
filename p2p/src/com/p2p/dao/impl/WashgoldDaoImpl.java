package com.p2p.dao.impl;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.p2p.bean.Washgold;
import com.p2p.dao.WashgoldDao;
import com.p2p.util.DbUtil;

public class WashgoldDaoImpl implements WashgoldDao {

	
	@Override
	public boolean addWashgold(Washgold washgold) {
		boolean bool=false;
		String sql="INSERT into washgold (userID,washDate,rank,getMoney,isFull) VALUES (?,?,?,?,?)";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(washgold.getUserID());
		params.add(washgold.getWashDate());
		params.add(washgold.getRank());
		params.add(washgold.getGetMoney());
		params.add(washgold.getIsFull());
		int count = DbUtil.executeUpdate(sql, params);
		if(count>0){
			bool=true;
		}
		return bool;
	}

	@Override
	public boolean updateWashgold(Washgold washgold) {
		boolean bool=false;
		String sql="update washgold set isFull=?,isGet=? where washID=?";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(washgold.getIsFull());
		params.add(washgold.getIsGet());
		params.add(washgold.getWashID());
		int count = DbUtil.executeUpdate(sql, params);
		if(count>0){
			bool=true;
		}
		return bool;
	}

	@Override
	public List<Washgold> findWashgoldByUserIDandDate(int userID, Date date) {
		ArrayList<Washgold> list=null;
		String sql="select * from washgold where userID="+userID+" and washDate="+"'"+date+"'";
		ResultSet res = DbUtil.executeQuery(sql, null);
		list=getListObject(res);
		return list;
	}

	private ArrayList<Washgold> getListObject(ResultSet res) {
		ArrayList<Washgold> list=new ArrayList<Washgold>();
		
		try {
			while(res.next()){
				Washgold washgold=new Washgold();
				washgold.setWashID(res.getInt("washID"));
				washgold.setUserID(res.getInt("userID"));
				washgold.setWashDate(res.getDate("washDate"));
				washgold.setRank(res.getInt("rank"));
				washgold.setGetMoney(res.getInt("getMoney"));
				washgold.setIsFull(res.getString("isFull"));
				washgold.setIsGet(res.getString("isGet"));
				list.add(washgold);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Washgold findWashgoldByUserIDandDateandRank(int userID, Date date,
			int rank) {
		String sql="select * from washgold where userID="+userID+" and washDate="+date+" and rank="+rank;
		ResultSet res = DbUtil.executeQuery(sql, null);
		ArrayList<Washgold> list=getListObject(res);
		Washgold washgold=list.get(0);
		return washgold;
	}

	@Override
	public Washgold findWashgoldByWashID(int washID) {
		String sql="select * from washgold where washID="+washID;
		ResultSet res = DbUtil.executeQuery(sql, null);
		ArrayList<Washgold> list=getListObject(res);
		Washgold washgold=list.get(0);
		return washgold;
	}
		

	
}
