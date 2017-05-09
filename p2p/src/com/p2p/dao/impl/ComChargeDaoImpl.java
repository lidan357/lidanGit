package com.p2p.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.p2p.bean.ComCharge;
import com.p2p.dao.ComChargeDao;
import com.p2p.util.DbUtil;

public class ComChargeDaoImpl implements ComChargeDao {

	@Override
	public boolean addComCharge(ComCharge comCharge) {
		boolean bool = false;
		String sql = "insert into comcharge (genTime,money,loanID) values(?,?,?)";
		ArrayList<Object> params = new ArrayList<Object>();
		params.add(comCharge.getGenTime());
		params.add(comCharge.getMoney());
		params.add(comCharge.getLoanID());

		int count = DbUtil.executeUpdate(sql, params);
		if (count > 0) {
			bool = true;
		}
		return bool;
	}

	@Override
	public ComCharge findComCharge(int loanID) {
		String sql="select * from comcharge where loanID="+loanID;
		ResultSet rs = DbUtil.executeQuery(sql, null);
		ComCharge comCharge=null;
		try {
			while(rs.next()){
				comCharge=new ComCharge();
				comCharge.setCharID(rs.getInt(1));
				comCharge.setGenTime(rs.getDate(2));
				comCharge.setMoney(rs.getFloat(3));
				comCharge.setLoanID(rs.getInt(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comCharge;
	}

	@Override
	public List<ComCharge> findAllComCharge() {
		ArrayList<ComCharge> list=new ArrayList<ComCharge>(); 
		String sql="select * from comcharge";
		ResultSet rs = DbUtil.executeQuery(sql, null);
		
		try {
			while(rs.next()){
				ComCharge comCharge=new ComCharge();
				comCharge.setCharID(rs.getInt(1));
				comCharge.setGenTime(rs.getDate(2));
				comCharge.setMoney(rs.getFloat(3));
				comCharge.setLoanID(rs.getInt(4));
				list.add(comCharge);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static void main(String[] args) {
		ComChargeDaoImpl test=new ComChargeDaoImpl();
		//System.out.println(test.findComCharge(1));
		System.out.println(test.findComCharge(50));
	}

}
