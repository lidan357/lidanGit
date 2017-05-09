package com.p2p.dao;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.p2p.bean.Interest;

public interface InterestDao {
	public boolean addInterest(Interest interest);
	
	public boolean updateInterest(Interest interest);
	public void deleteInerestByLoanId(int id);
	/**
	 * 查询该借贷编号所对应的贷款利息
	 * @param loanID 借贷编号
	 * @return
	 */

	
	/**
	 * 查询该用户的所有贷款利息信息
	 * @param userID
	 * @return
	 */
	public List<Interest> findInterestByUserID(int userID);

	List<Interest> findInterest(int reID);
	
	Interest findInterestByInterID(int interID);

	List<Interest> findInterestByStatus(String status);

	Interest findInterest(int reID, Date reInterDate);
	
	public List<Interest> queryInterestByCondition(String keywords,List<Object> params,HashMap<String,String> orderbys);

	public Object findObject(String sql);

	
	
}

