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

import com.p2p.bean.Interest;
import com.p2p.bean.Invest;
import com.p2p.bean.LoanComm;
import com.p2p.bean.LoanInfo;
import com.p2p.dao.InvestDao;
import com.p2p.servlet.admin.JSONObject;
import com.p2p.util.DbUtil;

public class InvestDaoImpl implements InvestDao{
	@Override
	public int addInvest(Invest invest) {
		boolean bool = false;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		int id=-1;
		String sql = "insert into invest(invID,loanID,userID,invMoney,totInter,gotInter,invDate) values(?,?,?,?,?,?,?) ;";	
		ResultSet rs= null;
		try {
			pstm = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			pstm.setInt(1, invest.getInvID());
			pstm.setInt(2, invest.getLoanID());
			pstm.setInt(3, invest.getUserID());
			pstm.setFloat(4, invest.getInvMoney());
			pstm.setFloat(5, invest.getTotInter());
			pstm.setFloat(6, invest.getGotInter());
			pstm.setDate(7, new java.sql.Date(invest.getInvDate().getTime()));
			int len = pstm.executeUpdate();
			if(len > 0) {
				bool = true;
			}
			rs = pstm.getGeneratedKeys();
			if(rs!=null){
			rs.next();
			id=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return id;
	}
	
	@Override
	public boolean updateInvest(Invest invest) {
		boolean bool = false;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		String sql = "update invest set loanID=?,userID=?,invMoney=?,totInter=?,gotInter=? ,invDate=? where invID=?";	
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, invest.getLoanID());
			pstm.setInt(2, invest.getUserID());
			pstm.setFloat(3, invest.getInvMoney());
			pstm.setFloat(4, invest.getTotInter());
			pstm.setFloat(5, invest.getGotInter());
			pstm.setDate(6, new java.sql.Date(invest.getInvDate().getTime()));
			pstm.setInt(7, invest.getInvID());
			
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
	 * 查看该用户所有投资记录
	 * @param userID 用户编号
	 * @return
	 */
	@Override
	public List<Invest> findInvestByUserID(int userID) {
		List<Invest> list = null;
		Invest invest = null;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from invest where userID=?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, userID);
			rs = pstm.executeQuery();
			list = new ArrayList<Invest>();
			while (rs.next()) {
				invest = resultToInvest(rs);
				list.add(invest);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.CloseAll();
		}
		return list;
	}
	/**
	 * 查看该借贷的所有投资记录
	 * @param loanID
	 * @return
	 */
	@Override
	public List<Invest> findInvestByLoanID(int loanID) {
		List<Invest> list = null;
		Invest invest = null;	
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from invest where loanID=?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, loanID);
			rs = pstm.executeQuery();
			list = new ArrayList<Invest>();
			while (rs.next()) {
				invest = resultToInvest(rs);
				list.add(invest);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtil.CloseAll();
		}
		return list;
	}

	@Override
	public List<Invest> queryInvestByCondition(String keywords,List<Object> params,HashMap<String,String> orderbys){
		String sql ="select * from invest where 1=1 "+keywords;
		List<Invest> invests =  new ArrayList<Invest>();
		Invest invest = new Invest();
		if(orderbys!=null&&orderbys.size()>=1){
			for(Entry<String,String> entry : orderbys.entrySet()){
				sql+=" "+entry.getKey()+" "+entry.getValue()+",";
				}
			sql = sql.substring(0, sql.length()-1);
			}
			PreparedStatement pre = DbUtil.getPreparedStatement(sql);
			if(pre!=null){
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
						invest =  resultToInvest(res);
						invests.add(invest);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					}finally{
						DbUtil.CloseAll();
					}
			}
		return invests;
	}

	private Invest resultToInvest(ResultSet rs) {
		Invest invest =  new 	Invest();
		
		try {
			invest.setInvID(rs.getInt("invID"));
			invest.setLoanID(rs.getInt("loanID"));
			invest.setUserID(rs.getInt("userID"));
			invest.setInvMoney(rs.getFloat("invMoney"));
			invest.setTotInter(rs.getFloat("totInter"));
			invest.setGotInter(rs.getFloat("gotInter"));
			invest.setInvDate(rs.getDate("invDate"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return invest;
	}

	@Override
	public int userCount(int id) {
		int count=0;
		String sql="select count(*) from invest where userID="+id;
		ResultSet rs=DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return count;
	}

	@Override
	public int getSUMinvMoneyByUser(int id) {
		int sumMoney=0;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select SUM(invMoney)as SUMinvMoney from invest where userID="+id;	
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				sumMoney = rs.getInt("SUMinvMoney");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return sumMoney;
	}

	@Override
	public JSONObject findCountBySql(String sql) {
		ResultSet res = DbUtil.getResultSet(sql);
		JSONObject obj =  new JSONObject();
		try {
			while(res.next()){
					obj.setPro(res.getString(1));
					obj.setVal(res.getObject(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		return obj;
	}

	@Override
	public List<JSONObject> findInvestBySql(String sql) {
		ResultSet res = DbUtil.getResultSet(sql);
		List<JSONObject> jsons = new ArrayList<JSONObject>();
		JSONObject json = null;
		try {
			while(res.next()){
				json = new JSONObject();
				json.setPro(res.getObject(1));
				json.setVal(res.getObject(2));
			jsons.add(json);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		return jsons;
	}

	@Override
	public Invest findInvestById(int id) {
		String sql ="select * from invest where invID="+id;
		ResultSet rs= DbUtil.getResultSet(sql);
		Invest inv = null;
		try {
			while(rs.next()){
				inv= resultToInvest(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return inv;
	}

	@Override
	public int findInvestUserCount() {
		String sql = "select count( distinct userID) from invest";
		int count=-1;
		ResultSet rs = DbUtil.getResultSet(sql);
		try {
			while(rs.next()){
				count  = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count ;
	}

	@Override
	public Invest findInvestByLoanIDandUserInfo(int loanID, int userID) {
		String sql ="select * from invest where loanID="+loanID+" and userID="+userID;
		ResultSet rs= DbUtil.getResultSet(sql);
		Invest inv = null;
		try {
			while(rs.next()){
				inv= resultToInvest(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return inv;
	}


	@Override
	public float findAllInvestMoney() {
		String sql="select sum(invMoney) from invest ";
		float money=0.0f;
		ResultSet rs= DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				money = rs.getFloat(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		return money;
	}

	@Override
	public int findInvestCount() {
		String sql ="select count(*) from invest";
		int count=0;
		ResultSet rs= DbUtil.executeQuery(sql, null);
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


	public float getMoneyByUserandDate(int userID,Date date) {
		String sql ="select sum(invMoney) from invest where userID="+userID+" and invDate="+"'"+date+"'";
		ResultSet rs= DbUtil.getResultSet(sql);
		float money=0;
		try {
			while(rs.next()){
				money= rs.getFloat(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return money;
	}

	@Override
	public Double findObjectBySql(String sql) {
		ResultSet rs = DbUtil.executeQuery(sql, null);
		Double object = null;
		try {
			while(rs.next()){
					object = rs.getDouble(1);
			}
		} catch(NullPointerException e){
			object = 0.0d;
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return object;
	}

	
	public static void main(String[] args) {
		float money = new InvestDaoImpl().getMoneyByUserandDate(2,new Date(System.currentTimeMillis()));
		System.out.println(money);
	}
	
	

}
