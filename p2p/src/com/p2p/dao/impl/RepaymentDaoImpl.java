package com.p2p.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import com.p2p.bean.Repayment;
import com.p2p.dao.RepaymentDao;
import com.p2p.util.DbUtil;

public class RepaymentDaoImpl implements RepaymentDao{

	/**
	 *   reID                 int not null,
   loanID               int,
   reqMoney             float(10,2),
   reDeadLine           int,
   factReTime           date,
   status   
	 */
	@Override
	public boolean addRepayment(Repayment repayment) {
				boolean res = false;
				String sql = "insert into repayment(loanID,reqMoney,reDeadLine,factReTime,status,userID)"
									+" values(?,?,?,?,?,?)";
				ResultSet re  =null;
				Connection con = DbUtil.getConnetion();
				PreparedStatement pre =null;
				try {
					pre= con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					pre.setInt(1, repayment.getLoanID());
					pre.setFloat(2, repayment.getReqMoney());
					pre.setInt(3, repayment.getReDeadTime());
					pre.setDate(4, null);
					pre.setString(5, repayment.getStatus());
					pre.setInt(6, repayment.getUserID());
					pre.executeUpdate();
			/*		re = pre.getGeneratedKeys();
					if(re!=null){
						re.next();
System.out.println(re.getInt(1));
					}*/
					res =true;
				} catch (SQLException e) {
					res = false;
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					DbUtil.CloseAll();
				}
		return res;
	}

	@Override
	public Repayment findRepayment(int loanID) {
		String sql = "select  * from repayment where loanID = ?";
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		Repayment repay = null;
		ResultSet res = null;
		try {
			pre.setInt(1, loanID);
			res = pre.executeQuery();
			while(res.next()){
				repay = resultToRepayment(res);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		return repay;
	}

	@Override
	public List<Repayment> findAllRepayment() {
		List<Repayment> repayments = new ArrayList<Repayment>();
		String sql = "select  * from repayment";
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		Repayment repay = null;
		ResultSet res = null;
		try {
			res = pre.executeQuery();
			while(res.next()){
				repay = resultToRepayment(res);
				repayments.add(repay);		
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		return repayments;
	}

	/**
	 * 
	 * @param res
	 * @return
	 */
	public Repayment resultToRepayment(ResultSet res){
		Repayment repay = new Repayment();
		try {
			repay.setFactRetime(res.getDate("factReTime"));
			repay.setLoanID(res.getInt("loanId"));
			repay.setReDeadTime(res.getInt("reDeadLine"));
			repay.setUserID(res.getInt("userID"));
			repay.setReID(res.getInt("reID"));
			repay.setReqMoney(res.getFloat("reqMoney"));
			repay.setStatus(res.getString("status"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return repay;
	}
	
	
	@Override
	public List<Repayment> findRepaymentByStatus(String status) {
		return null;
	}

	
	public List<Repayment> queryRepaymentsByCondition(String keywords,List<Object> params,HashMap<String,String> orderbys){
		String sql ="select * from repayment where 1=1 "+keywords;
		List<Repayment> repays =  new ArrayList<Repayment>();
		Repayment repay = new Repayment();
		if(orderbys!=null&&orderbys.size()>=1){
			for(Entry<String,String> entry : orderbys.entrySet()){
				sql+=" "+entry.getKey()+" "+entry.getValue()+",";
				}
			sql = sql.substring(0, sql.length()-1);
			}
			PreparedStatement pre = DbUtil.getPreparedStatement(sql);
			try {
					if(params!=null&&params.size()>=1){
						for(int i=0;i<params.size();i++){
							if(params.get(i) instanceof Double){
								Double param = (Double)(params.get(i));
									pre.setDouble(i+1,param);
								}else{
									pre.setString(i+1,params.get(i).toString());
								}
								}
							}
					ResultSet res = pre.executeQuery();
					while(res.next()){
						repay = resultToRepayment(res);
						repays.add(repay);
					}
						
					}catch (SQLException e) {
						e.printStackTrace();
					}finally{
						DbUtil.CloseAll();
					}
		return repays;
	}
	
	@Override
	public List<Repayment> findRepaymentUntil(java.util.Date date) {
		return null;
	}

	@Override
	public boolean update(Repayment repayment) {
		boolean res = false;
		String sql = "update  repayment set loanID=?,reqMoney=?,reDeadLine=?,factReTime=?,status=?,userID=? "
				 +" where reID=?";

		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		try {
			pre.setInt(1, repayment.getLoanID());
			pre.setFloat(2, repayment.getReqMoney());
			pre.setInt(3, repayment.getReDeadTime());
			pre.setDate(4, new java.sql.Date(repayment.getFactRetime().getTime()));
			pre.setString(5, repayment.getStatus());
			pre.setInt(6, repayment.getUserID());
			pre.setInt(7, repayment.getReID());
			pre.executeUpdate();
			res =true;
		} catch (SQLException e) {
			res = false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return res;
	}

	@Override
	public int findAllRepaymentsCount() {
		String sql ="select count(*) from repayment ";
		ResultSet rs = DbUtil.getResultSet(sql);
		int count=-1;
		try {
			while(rs.next()){
				count = rs.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	
}
