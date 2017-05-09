package com.p2p.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.p2p.bean.LoanComm;
import com.p2p.dao.LoanCommDao;
import com.p2p.util.DbUtil;


public class LoanCommDaoImpl implements LoanCommDao{
	@Override
	public boolean addLoanComm(LoanComm loanComm) {
		boolean bool = false;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		String sql = "insert into loancomm(comID,loanID,userID,comDate,comContent) values(?,?,?,?,?) ;";	
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, loanComm.getComID());
			pstm.setInt(2, loanComm.getLoanID());
			pstm.setInt(3, loanComm.getUserID());
			pstm.setDate(4,loanComm.getComDate());
			pstm.setString(5, loanComm.getComContent());
			int len = pstm.executeUpdate();
			if(len > 0) {
				bool = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return bool;
	}
	/**
	 * 根据贷款编号返回该条借贷所有的评论
	 * @param loanID 贷款编号
	 * @return
	 */
	@Override
	public List<LoanComm> findLoanComm(int loanID) {
		List<LoanComm> list =  new ArrayList<LoanComm>();
		LoanComm loancomm = null;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from loancomm where loanID=?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, loanID);
			rs = pstm.executeQuery();
			while (rs.next()) {
				loancomm = getLoanCommByResult(rs);
				list.add(loancomm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.CloseAll();
		}
		return list;
	}
	private LoanComm getLoanCommByResult(ResultSet rs) {
		LoanComm loanComm = new LoanComm();
		try {
			loanComm.setComID(rs.getInt("comID"));
			loanComm.setLoanID(rs.getInt("loanID"));
			loanComm.setUserID(rs.getInt("userID"));
			loanComm.setComDate(rs.getDate("comDate"));
			loanComm.setComContent(rs.getString("comContent"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loanComm;
	}
	@Override
	public List<LoanComm> findAllLoanComm() {
		List<LoanComm> list =  new ArrayList<LoanComm>();
		LoanComm loancomm = null;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from loancomm ";
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				loancomm = getLoanCommByResult(rs);
				list.add(loancomm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.CloseAll();
		}
		return list;
	}
	


}
