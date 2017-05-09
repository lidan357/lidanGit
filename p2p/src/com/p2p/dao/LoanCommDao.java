package com.p2p.dao;

import java.util.List;

import com.p2p.bean.LoanComm;

public interface LoanCommDao {
	public boolean addLoanComm(LoanComm loanComm); 
	
	/**
	 * 根据贷款编号返回该条借贷所有的评论
	 * @param loanID 贷款编号
	 * @return
	 */
	public List<LoanComm> findLoanComm(int loanID);

	public List<LoanComm> findAllLoanComm(); 
}
