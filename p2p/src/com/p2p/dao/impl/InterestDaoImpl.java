package com.p2p.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import com.p2p.bean.Interest;
import com.p2p.bean.Repayment;
import com.p2p.dao.InterestDao;
import com.p2p.util.DbUtil;

public class InterestDaoImpl implements InterestDao{
/**
 * interID  int(11) NOT NULL
reID   int(11) NULL
reInterDate  date NULL
factReDate date NULL
curMonIsRe     varchar(10) NULL
reMonRe
 * @throws SQLException 
 * 
 * 
 */
	@Override
	public boolean addInterest(Interest interest) {
	
		boolean res = false;
		String sql = "insert into interest(loanID,reInterDate,curMonIsRe,reMonRe,userID) "
								+" values(?,?,?,?,?)";
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		try {
			pre.setInt(1, interest.getLoanID());
			pre.setDate(2, new java.sql.Date(interest.getReInterDate().getTime()));
			pre.setString(3, interest.getCorMonIsRe());
			pre.setFloat(4, interest.getReMonRe());
			pre.setInt(5, interest.getUserID());
			pre.execute();
			res =true;
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		return res;
	}

	public void deleteInerestByLoanId(int id){
		String sql2="delete  from interest where loanID="+id;
		DbUtil.executeUpdate(sql2, null);
	}
	
	
	@Override
	public boolean updateInterest(Interest interest) {
		boolean res =false;
		String sql  = "update interest set loanID=?,reInterDate=?,factReDate=?,  "
							+" curMonIsRe = ? , reMonRe=?,userID=? where interID = ?";
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		
		try {
			pre.setInt(1, interest.getLoanID());
			pre.setDate(2, new java.sql.Date(interest.getReInterDate().getTime()));
			pre.setDate(3, new java.sql.Date(interest.getFactReDate().getTime()));
			pre.setString(4, interest.getCorMonIsRe());
			pre.setFloat(5, interest.getReMonRe());
			pre.setInt(6, interest.getUserID());
			pre.setInt(7, interest.getInterID());
			pre.executeUpdate();
			res=true;
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return res;
	}

	@Override
	public Interest findInterest(int reID, Date reInterDate) {
			Date d2 = new Date(reInterDate.getTime()+24*60*60*1000); 
			String sql ="select * from interest where reID = ? and reInterDate >? and reInterDate < ? ";
			PreparedStatement pre = DbUtil.getPreparedStatement(sql);
			Interest inter = null;
				try {
				pre.setInt(1, reID);
				pre.setDate(2, new java.sql.Date(reInterDate.getTime()));
				pre.setDate(3, new java.sql.Date(d2.getTime()));
				ResultSet res = pre.executeQuery();
				while(res.next()){
					inter = resultToInterest(res);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				DbUtil.CloseAll();
			}
		return inter;
	}


	@Override
	public  List<Interest> findInterest(int reID) {
		String sql ="select * from interest where reID = ?  ";
		List<Interest> inters = new ArrayList<Interest>();
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		Interest inter = null;
			try {
			pre.setInt(1, reID);
			ResultSet res = pre.executeQuery();
			while(res.next()){
				inter = resultToInterest(res);
				inters.add(inter);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		
		return inters;
	}

/**
 * 将查询到的数据 绑定对象的代码 进行封装 这样减少代码的
 * 重复
 * @param res
 * @return
 */
	public Interest resultToInterest(ResultSet res){
		Interest inter = new Interest();
		try {
			inter.setCorMonIsRe(res.getString("curMonIsRe"));
			inter.setFactReDate(res.getDate("factReDate"));
			inter.setInterID(res.getInt("interID"));
			inter.setLoanID(res.getInt("loanID"));
			inter.setUserID(res.getInt("userID"));
			inter.setReInterDate(res.getDate("reInterDate"));
			inter.setReMonRe(res.getFloat("reMonRe"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return inter;
	}
	
	
	@Override
	public  List<Interest> findInterestByStatus(String status) {
		String sql ="select * from interest where curMonIsRe = ?  ";
		List<Interest> inters = new ArrayList<Interest>();
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		Interest inter = null;
			try {
			pre.setString(1, status);
			ResultSet res = pre.executeQuery();
			while(res.next()){
				inter = resultToInterest(res);;
				inters.add(inter);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		return inters;
	}


	/*@Override
	public Interest findInterestByLoanID(int loanID) {
		
		String sql ="select * from interest where loanID = ?  ";
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		Interest inter = null;
			try {
			pre.setInt(1, loanID);
			ResultSet res = pre.executeQuery();
			while(res.next()){
				inter = resultToInterest(res);;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return inter;
	}*/

	@Override
	public List<Interest> findInterestByUserID(int userID) {
		String sql ="select * from interest where userID = ?  ";
		List<Interest> inters = new ArrayList<Interest>();
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		Interest inter = null;
			try {
			pre.setInt(1, userID);
			ResultSet res = pre.executeQuery();
			while(res.next()){
				inter = resultToInterest(res);
				inters.add(inter);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return inters;
	}

	/**
	 * 所有查询数据的都可以使用这个查询，根据查询的条件 和参数 可以
	 * 组织不同的sql查询语句
	 */
	public List<Interest> queryInterestByCondition(String keywords,List<Object> params,HashMap<String,String> orderbys){
		String sql ="select * from interest where 1=1 "+keywords;
		List<Interest> inters =  new ArrayList<Interest>();
		Interest inter = new Interest();
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
						inter =  resultToInterest(res);
						inters.add(inter);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					}finally{
						DbUtil.CloseAll();
					}
		return inters;
	}


	@Override
	public Interest findInterestByInterID(int interID) {
		String sql ="select * from interest where interID ="+interID;
		ResultSet res = DbUtil.executeQuery(sql, null);
		Interest inter=new Interest();
		try {
			while(res.next()){
				inter = resultToInterest(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return inter;
	}

	@Override
	public Object findObject(String sql) {
		ResultSet rs = DbUtil.executeQuery(sql, null);
		Object o = new Object();
		try {
			while(rs.next()){
				o = rs.getObject(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return o;
	}
	
	
}
