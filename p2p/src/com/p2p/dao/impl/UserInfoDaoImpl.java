package com.p2p.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.p2p.bean.UserInfo;
import com.p2p.dao.UserInfoDao;
import com.p2p.util.DbUtil;

public class UserInfoDaoImpl implements UserInfoDao {

	@Override
	public boolean addUserInfo(UserInfo userInfo) {
		boolean flag = false;
		int count = 0;
		String sql = "insert into userinfo(userName,password,email,balance,realName,age,residence,phone," +
				"sex,eduExp,monthInco,job,status,userIconAddr,userID) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		count = getCount(userInfo,sql);
		if(count>0){
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean updateUserInfo(UserInfo userInfo) {
		boolean flag = false;
		int count = 0;
		String sql = "update userinfo set userName=?,password=?,email=?,balance=?,realName=?,age=?," +
				"residence=?,phone=?,sex=?,eduExp=?,monthInco=?,job=?,status=?,userIconAddr=? where userID=?";
		count = getCount(userInfo,sql);
		if(count>0){
			flag = true;
		}
		return flag;
	}

	
	@Override
	public UserInfo findUserInfo(int userID) {
		UserInfo userInfo = null;
		List<Object> params = new ArrayList<Object>();
		String sql = "select userID,userName,password,email,balance,realName,age,residence,phone,sex," +
				"eduExp,monthInco,job,status,userIconAddr from userinfo where userID=?";
		params.add(userID);
		ResultSet rs = DbUtil.executeQuery(sql, params);
		try {
			while(rs.next()){
				
				userInfo = getUserInfo(rs);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DbUtil.CloseAll();
		}
		return userInfo;
	}
	@Override
	public UserInfo findUserInfo(String userName,String phone) {
		UserInfo userInfo = null;
		List<Object> params = new ArrayList<Object>();
		String sql = "";
		if(userName!=null){
			sql = "select userID,userName,password,email,balance,realName,age,residence,phone,sex," +
					"eduExp,monthInco,job,status,userIconAddr from userinfo where userName=?";
			params.add(userName);
		}else if(phone!=null){
			sql = "select userID,userName,password,email,balance,realName,age,residence,phone,sex," +
					"eduExp,monthInco,job,status,userIconAddr from userinfo where phone=?";
			params.add(phone);
		} else{
			
		}
		
		ResultSet rs = DbUtil.executeQuery(sql, params);
		try {
			while(rs.next()){
				userInfo = getUserInfo(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DbUtil.CloseAll();
		}
		return userInfo;
	}
	
	
	@Override
	public List<UserInfo> findAllUserInfo() {
		List<UserInfo> list = new ArrayList<UserInfo>();
		String sql = "select userID,userName,password,email,balance,realName,age,residence,phone,sex," +
				"eduExp,monthInco,job,status,userIconAddr from userinfo";
		ResultSet rs = DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				UserInfo userInfo = getUserInfo(rs);
				list.add(userInfo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DbUtil.CloseAll();
		}
		return list;
	}
	//求总人数
	public int getUserAllnumber(){
		int all=0;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(userID)as userMunber from userinfo";	
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				all = rs.getInt("userMunber");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return all;
	}
	
	
	
	//设置UserInfo，并返回一个UserInfo对象
	public UserInfo getUserInfo(ResultSet rs){
		UserInfo userInfo = null;
		
		userInfo = new UserInfo();
		try {
			userInfo.setUserID(rs.getInt(1));
			userInfo.setUserName(rs.getString(2));
			userInfo.setPassword(rs.getString(3));
			userInfo.setEmail(rs.getString(4));
			userInfo.setBalance(rs.getFloat(5));
			userInfo.setRealName(rs.getString(6));
			userInfo.setAge(rs.getInt(7));
			userInfo.setResidence(rs.getString(8));
			userInfo.setPhone(rs.getString(9));
			userInfo.setSex(rs.getString(10));
			userInfo.setEduExp(rs.getString(11));
			userInfo.setMonthInco(rs.getInt(12));
			userInfo.setJob(rs.getString(13));
			userInfo.setStatus(rs.getString(14));
			userInfo.setUserIconAddr(rs.getString(15));
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userInfo;
		
	}
	
	//设置params,并获取count值
	public int getCount(UserInfo userInfo,String sql){
		int count = 0;
		List<Object> params = new ArrayList<Object>();
		params.add(userInfo.getUserName());
		params.add(userInfo.getPassword());
		params.add(userInfo.getEmail());
		params.add(userInfo.getBalance());
		params.add(userInfo.getRealName());
		params.add(userInfo.getAge());
		params.add(userInfo.getResidence());
		params.add(userInfo.getPhone());
		params.add(userInfo.getSex());
		params.add(userInfo.getEduExp());
		params.add(userInfo.getMonthInco());
		params.add(userInfo.getJob());
		params.add(userInfo.getStatus());
		params.add(userInfo.getUserIconAddr());
		//params.add(userInfo.getRedPacket());
		params.add(userInfo.getUserID());
		
		
		count = DbUtil.executeUpdate(sql, params);
		return count;
	}

	@Override
	public UserInfo getUserInfoById(int userID) {
		String sql ="select * from userInfo where userId= ?";
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		UserInfo userInfo = null;
		ResultSet res = null;
		try {
			pre.setInt(1, userID);
			res = pre.executeQuery();
			while(res.next()){
				userInfo = getUserInfo(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		return userInfo;
	}

	@Override
	public int getCountByCondition(String keyword) {
		int count=-1;
		String sql ="select count(*) from userInfo where 1=1 "+keyword;
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		ResultSet rs= null;
		try {
			rs = pre.executeQuery();
			while(rs.next()){
				count= rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return count;
	}

	@Override
	public List<UserInfo> findUsersBySql(String sql) {
		List<UserInfo> list = new ArrayList<UserInfo>();
		ResultSet rs = DbUtil.getResultSet(sql);
		try {
			while(rs.next()){
				UserInfo userInfo = getUserInfo(rs);
				list.add(userInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public float findRedPacketByUserID(int userID) {	
		float money=0;
		String sql="select redPacket from userinfo where userID="+userID;
		ResultSet res = DbUtil.getResultSet(sql);
		try {
			while(res.next()){
				money=res.getFloat(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return money;
	}

	@Override
	public boolean updateRedpacket(UserInfo userInfo) {
		boolean flag = false;
		int count = 0;
		String sql = "update userinfo set redPacket=? where userID=?";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(userInfo.getRedPacket());
		params.add(userInfo.getUserID());
		count=DbUtil.executeUpdate(sql, params);
		if(count>0){
			flag=true;
		}
		return flag;
	}

	
	

}
