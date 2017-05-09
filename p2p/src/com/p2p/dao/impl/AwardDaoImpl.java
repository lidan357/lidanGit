package com.p2p.dao.impl;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.p2p.bean.Award;
import com.p2p.dao.AwardDao;
import com.p2p.util.DbUtil;

public class AwardDaoImpl implements AwardDao{

	@Override
	public boolean add(Award award) {
		Boolean flag = false;
		int count = 0;
		String sql = "insert into award(awdID,userID,awdDate,awdMoney,times) values(?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(award.getAwdID());
		params.add(award.getUserID());
		params.add(award.getAwdDate());
		params.add(award.getAwdMoney());
		params.add(award.getTimes());
		count = DbUtil.executeUpdate(sql, params);
		if(count>0){
			flag=true;
		}
		return flag;
	}

	@Override
	public boolean update(Award award) {
		boolean flag = false;
		int count = 0;
		String sql = "update award set userID=?,awdDate=?,awdMoney=?,times=? where awdID=?";
		List<Object> params = new ArrayList<Object>();
		params.add(award.getUserID());
		params.add(award.getAwdDate());
		params.add(award.getAwdMoney());
		params.add(award.getTimes());
		params.add(award.getAwdID());
		count = DbUtil.executeUpdate(sql, params);
		if(count>0){
			flag=true;
		}
		return flag;
	}

	@Override
	public Award findAward(int userID, Date date) {
		Award award  = null;
		//此处的date必须用引号包裹起来，因为Date类型并不是一个字符串
		String sql = "select awdID,userID,awdDate,awdMoney,times from award where userID="+userID+" and awdDate="+"'"+date+"'";
		//System.out.println(sql);
		ResultSet rs = DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				award = new Award();
				award.setAwdID(rs.getInt("awdID"));
				award.setUserID(rs.getInt("userID"));
				award.setAwdDate(rs.getDate("awdDate"));
				award.setAwdMoney(rs.getInt("awdMoney"));
				award.setTimes(rs.getInt("times"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return award;
	}

	@Override
	public Award findAwardByAwdID(int awdID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Award> findAllAwardByAwdID(int userID) {
		List<Award> list = new ArrayList<Award>();
		String sql = "select awdID,userID,awdDate,awdMoney,times from award where userID="+userID;
		ResultSet rs = DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				Award award = new Award();
				award.setAwdID(rs.getInt("awdID"));
				award.setUserID(rs.getInt("userID"));
				award.setAwdDate(rs.getDate("awdDate"));
				award.setAwdMoney(rs.getInt("awdMoney"));
				award.setTimes(rs.getInt("times"));
				list.add(award);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return list;
	}

	@Override
	public int countMoney(int userID) {
		int count = 0;
		String sql = "select sum(awdMoney) from award where userID="+userID;
		ResultSet rs = DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return count;
	}

}
