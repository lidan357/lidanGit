package com.p2p.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.p2p.bean.ManagerInfo;
import com.p2p.dao.ManagerInfoDao;
import com.p2p.util.DbUtil;

public class ManagerInfoDaoImpl implements ManagerInfoDao {

	@Override
	public ManagerInfo checkManagerLogin(String manName, String password) {
		String sql ="select * from managerInfo where managerName=? and mPassword=?";
		ManagerInfo manager = null;
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		ResultSet res= null;
		
		try {
			pre.setString(1, manName);
			pre.setString(2, password);
			res =pre.executeQuery();
			while(res.next()){
				manager = resultToManagerInfo(res);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return manager;
	}

	private ManagerInfo resultToManagerInfo(ResultSet res) {
		ManagerInfo manager  = new ManagerInfo();
		try {
			manager.setManagerID(res.getInt("managerID"));
			manager.setManagerName(res.getString("managerName"));
			manager.setPhone(res.getString("phone"));
			manager.setmPassword(res.getString("mPassword"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return manager;
	}

	@Override
	public List<ManagerInfo> findAllManagerInfo() {
		return null;
	}

	@Override
	public boolean updateManager(ManagerInfo managerInfo) {
		String sql = "update managerinfo set managerName=?,mPassword=? "
				+ ", phone = ? where managerID=?";
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		try {
			pre.setString(1, managerInfo.getManagerName());
			pre.setString(2, managerInfo.getmPassword());
			pre.setString(3, managerInfo.getPhone());
			pre.setInt(4, managerInfo.getManagerID());
			pre.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}

	@Override
	public boolean deleteManagerInfo(ManagerInfo managerInfo) {
		String sql = "delete  from managerinfo where managerid= "+managerInfo.getManagerID();
		DbUtil.executeUpdate(sql, null);
		return false;
	}

	@Override
	public boolean addManagerInfo(ManagerInfo managerInfo) {
		boolean result=false;
		String sql = "insert into managerinfo(managerName,mpassword,phone) "
				+ " value(?,?,?)";
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		try {
			pre.setString(1, managerInfo.getManagerName());
			pre.setString(2, managerInfo.getmPassword());
			pre.setString(3, managerInfo.getPhone());
			result = pre.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public ManagerInfo findManagerById(int id) {
		String sql = "select * from managerinfo where managerid="+id;
		ResultSet rs= DbUtil.executeQuery(sql, null);
		ManagerInfo manager = null;
		try {
			while(rs.next()){
				manager = resultToManagerInfo(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return manager;
	}

	@Override
	public int findAddminCount() {
		String sql ="select count(*) from managerInfo";
		ResultSet rs = DbUtil.getResultSet(sql);
		int count=-1;
		try {
			while(rs.next()){
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<ManagerInfo> findManagerInfosBySql(String sql) {
		ResultSet rs = DbUtil.getResultSet(sql);
		List<ManagerInfo> list = new ArrayList<ManagerInfo>();
		ManagerInfo info = null;
		try {
			while(rs.next()){
				info =  resultToManagerInfo(rs);
				list.add(info);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	
}
