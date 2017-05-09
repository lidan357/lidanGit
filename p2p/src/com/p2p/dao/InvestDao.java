package com.p2p.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import com.p2p.bean.Interest;
import com.p2p.bean.Invest;
import com.p2p.bean.LoanInfo;
import com.p2p.servlet.admin.JSONObject;

public interface InvestDao {
	public int addInvest(Invest Invest);
	
	public boolean updateInvest(Invest invest);
	
	/**
	 * 查看该用户所有投资记录
	 * @param userID 用户编号
	 * @return
	 */
	public List<Invest> findInvestByUserID(int userID);
	
	/**
	 * 查看该借贷的所有投资记录
	 * @param loanID
	 * @return
	 */
	public List<Invest> findInvestByLoanID(int loanID);

	public List<Invest> queryInvestByCondition(String keywords,List<Object> params,HashMap<String,String> orderbys);  

	int userCount(int id);
	
	int getSUMinvMoneyByUser(int id);

	public JSONObject findCountBySql(String sql1);

	public List<JSONObject> findInvestBySql(String sql);

	public Invest findInvestById(int id);
	
	public int findInvestUserCount();
	
	public Invest findInvestByLoanIDandUserInfo(int loanID,int userID);


	public float findAllInvestMoney();

	public int findInvestCount();

	
	float getMoneyByUserandDate(int userID,Date date);

	public Object findObjectBySql(String sql);

}
