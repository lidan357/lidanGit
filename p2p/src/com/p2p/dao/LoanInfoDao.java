package com.p2p.dao;

import java.util.HashMap;
import java.util.List;

import com.p2p.bean.Interest;
import com.p2p.bean.LoanInfo;
import com.p2p.servlet.admin.JSONObject;

public interface LoanInfoDao {
	//获取loanID的最大值
	public int getMaxLoanID();
	
	public int addLoanInfo(LoanInfo loanInfo);
	
	public boolean updateLoanInfo(LoanInfo loanInfo);
	
	public List<LoanInfo> findAllLoanInfo();
	
	public List<LoanInfo> findLoanInfoByUserID(int userID);
	
	public List<LoanInfo> findAllLoanInfo(int curPage,int rowsPrePage);
	
	/**
	 * 根据项目的期限来查找借贷信息
	 * @param deadLine 贷款期限
	 * @return 借贷信息集合
	 */
	public String findByDeadLine(int deadLineMin,int deadLineMax);
	
	/**
	 * 根据项目的状态来查找借贷信息
	 * @param status 贷款状态
	 * @return 借贷信息集合
	 */
	public List<LoanInfo> findByStatus(String status);
	
	/**
	 * 根据项目的状态来查找借贷信息
	 * @param inter 贷款利息
	 * @return 借贷信息集合
	 */
	public List<LoanInfo> findByInter(float interMin,float interMax);
	
	/**
	 * 根据项目的状态来查找借贷信息
	 * @param loanType 贷款类型
	 * @return 借贷信息集合
	 */
	public List<LoanInfo> findByLoanType(String loanType);
	//返回所有查询记录条数
	int queryMsgCount();
	
	//返回某个用户的借贷记录条数
	int userCount(int userID);
	

	public int getSUMcurMoney();

	public int getSUMloanMoney();
	
	public int getSUMloanMoneyByUser(int id);

	public LoanInfo findLoanInfoById(int id);
	
	public int findCountByKeyword(String keyword);
	public List<JSONObject> findCountBySql(String sql);
	
	public List<LoanInfo> queryLoanInfoByCondition(String keywords,List<Object> params,HashMap<String,String> orderbys);
}
