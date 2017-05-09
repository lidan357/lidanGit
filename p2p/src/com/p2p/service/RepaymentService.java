package com.p2p.service;

import java.util.List;

import com.p2p.bean.Repayment;
import com.p2p.util.PageUtil;


public interface RepaymentService {

	List<Repayment> findAllRepayMents();
	List<Repayment> findRepayMentsByLoanId(int loanId);
	List<Repayment> findRepayMentsByUserId(int userId);
	
	boolean repayment(int loanID);
	
	public int getCountByCondition(String keyword);
	
	public float requiredRepayMoney();
	List<Repayment> findRepayMentsByPage(PageUtil pg);
	int findAllRepayMentsCount();
	void generatedRepayPlan(int lid);
	float findRepayedRepay();
	float findWaitRepayMoney();
}
