package com.p2p.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.p2p.bean.MorGoods;
import com.p2p.dao.MorGoodsDao;
import com.p2p.util.DbUtil;

public class MorGoodsDaoImpl implements MorGoodsDao {

	@Override
	public boolean addMorGoods(MorGoods morGoods) {
			boolean bool=false;
			String sql="insert into morgoods (morType,buyTime,descr,realPic,loanID) values(?,?,?,?,?)";
			ArrayList<Object> params=new ArrayList<Object>();
			params.add(morGoods.getMorType());
			params.add(morGoods.getBuyTime());
			params.add(morGoods.getDescr());
			params.add(morGoods.getRealPic());
			params.add(morGoods.getLoanID());
			
			int count = DbUtil.executeUpdate(sql, params);
			if(count>0){
				bool=true;
			}
		return bool;
	}

	@Override
	public MorGoods findMorGoods(int loanID) {
		String sql="select * from morgoods where loanID="+loanID;
		ResultSet rs = DbUtil.executeQuery(sql, null);
		MorGoods morgoods=null;
		try {
			while(rs.next()){
				morgoods=new MorGoods();
				morgoods.setMorID(rs.getInt("morID"));
				morgoods.setMorType(rs.getString("morType"));
				morgoods.setBuyTime(rs.getDate("buyTime"));
				morgoods.setDescr(rs.getString("descr"));
				morgoods.setRealPic(rs.getString("realPic"));
				morgoods.setLoanID(loanID);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return morgoods;
	}
	public static void main(String[] args) {
		MorGoodsDaoImpl test=new MorGoodsDaoImpl();
		MorGoods morGoods=test.findMorGoods(0);
		System.out.println(morGoods);
	}
}
