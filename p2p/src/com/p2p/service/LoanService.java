package com.p2p.service;

import java.util.List;

import net.sf.json.JSONArray;

import com.p2p.bean.LoanInfo;
import com.p2p.util.ExcelFileGenerator;

public interface LoanService {
	public List<LoanInfo> findAllLoanInfo();
	
	public List<LoanInfo> findAllLoanInfo(int curPage,int rowsPrePage);
	
	int queryMsgCount();
	
	public String findByDeadLine(int deadLineMin,int deadLineMax);
	
	public List<LoanInfo> findLoanInfoByUserID(int userID);

	public LoanInfo findLoanInfoById(int id);

	public void updateStatus(int lid, String status);
	
	public JSONArray findStatistic(String staType);
//	public JSONArray findLoanCountSta(String statype);
/*	public JSONArray findLoanMoneySta();
	public JSONArray findCheckedAndUnCheckedSta();
	public JSONArray findLoanInterSta();
	public JSONArray findFrequentlyLoanUserSta();
	public JSONArray findDeadLineSta();
*/

	public JSONArray findWaitApprLoanInfos();

	public JSONArray getFailedLoanInfos();	

	public int findLoanUserCount();
	
	public int findLoanCount();
	
	public float findTotLoanMoney();
	
	public int findFinishedLoan();
	
	public int findCheckingLoan();
	
	public int findFinancingLoan();
	
	public int findRepayingLoan();
	
	public int findFailedLoan();
	
	public int findCountByCondition(String condition);

	public ExcelFileGenerator getExcel();

	public float findAverUserLoan();

	public float findAverItemLoan();
	
}
