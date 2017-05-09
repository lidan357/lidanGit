package com.p2p.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.p2p.bean.Repayment;

public interface RepaymentDao {
	public boolean addRepayment(Repayment epayment);
	
	/**
	 * @param loanID 贷款编号
	 * @return 一条还款记录
	 */
	public Repayment findRepayment(int loanID);
	
	public List<Repayment> findAllRepayment();

	List<Repayment> findRepaymentByStatus(String status);

	List<Repayment> findRepaymentUntil(Date date);
	
	public boolean update(Repayment repay);
	
	public List<Repayment> queryRepaymentsByCondition(String keywords,List<Object> params,HashMap<String,String> orderbys);

	public int findAllRepaymentsCount();
	
}
