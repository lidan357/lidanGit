package com.p2p.dao.impl;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.p2p.bean.InvInter;
import com.p2p.dao.InvInterDao;
import com.p2p.util.DbUtil;

public class InvInterDaoImpl implements InvInterDao {
	
	@Override
	public boolean addInvInter(InvInter invInter) {
		boolean bool=false;
		String sql="insert into invinter (loanID,userID,getDate,factGeDate,curMonIsGe,reMongGe) values (?,?,?,?,?,?)";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(invInter.getLoanID());
		params.add(invInter.getUserID());
		params.add(invInter.getGetDate());		
		params.add(invInter.getFactGetDate());
		params.add(invInter.getCurMonIsGe());
		params.add(invInter.getReMongGe());
		int count = DbUtil.executeUpdate(sql, params);
		if(count>0){
			bool=true;
		}
		return bool;
	}

	@Override
	public boolean updateInvInter(InvInter invInter) {
		Boolean flag = false;
		String sql = "update invinter set loanID=?,userID=?,getDate=?,factGeDate=?,curMonIsGe=?,reMongGe=? where interID=?";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(invInter.getLoanID());
		params.add(invInter.getUserID());
		params.add(invInter.getGetDate());		
		params.add(invInter.getFactGetDate());
		params.add(invInter.getCurMonIsGe());
		params.add(invInter.getReMongGe());
		params.add(invInter.getInterID());
		int count = DbUtil.executeUpdate(sql, params);
		if(count>0){
			flag=true;
		}
		return flag;
	}

	@Override
	public List<InvInter> findInvInterByLoanID(int id) {
		List<InvInter> list = new ArrayList<InvInter>();
		InvInter inv = null;
		String sql = "select * from invinter where loanID="+id;
		ResultSet rs=DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				inv = new InvInter();
				int interID = rs.getInt(1);
				int loanID = rs.getInt(2);
				int userID = rs.getInt(3);
				Date getDate = rs.getDate(4);
				Date factGetDate = rs.getDate(5);
				String curMonIsGe = rs.getString(6);
				float reMongGe = rs.getFloat(7);
				
				inv.setInterID(interID);
				inv.setLoanID(loanID);
				inv.setUserID(userID);
				inv.setGetDate(getDate);
				inv.setFactGetDate(factGetDate);
				inv.setCurMonIsGe(curMonIsGe);
				inv.setReMongGe(reMongGe);
				list.add(inv);
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
	public List<InvInter> findInvInterByUserID(int userID) {
		return null;
	}

	@Override
	public void deleteByUserIdAndLoanId(int userID, int loanID) {
		String sql2="delete  from invinter where loanID="+loanID+
				" and userID = "+userID;
		DbUtil.executeUpdate(sql2, null);
	}

	@Override
	public List<InvInter> findInvInterByStatus(String string) {
		String sql = "select * from invinter where curMonIsGe = '"+string+"'";
		ResultSet rs = DbUtil.executeQuery(sql, null);
		List<InvInter> invInters = new ArrayList<InvInter>();
		try {
			while(rs.next()){
				InvInter inter = resultToInvInter(rs);
			invInters.add(inter);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return invInters;
	}

	private InvInter resultToInvInter(ResultSet rs) {
		InvInter inter =  new InvInter();
		try {
			inter.setCurMonIsGe(rs.getString("curMonIsGe"));
			inter.setFactGetDate(rs.getDate("factGeDate"));
			inter.setGetDate(rs.getDate("getDate"));
			inter.setInterID(rs.getInt("interID"));
			inter.setLoanID(rs.getInt("loanID"));
			inter.setReMongGe(rs.getFloat("reMongGe"));
			inter.setUserID(rs.getInt("userID"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return inter;
	}

	
	
}
