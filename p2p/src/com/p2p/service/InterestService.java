package com.p2p.service;

import java.util.List;

import com.p2p.bean.Interest;

public interface InterestService {

	List<Interest> findInterestByLoanId(int id);
	boolean payInterest(int interID);
	void generatedInterestPlan(int lid);
	float findRepayedInter();
	float findWaitRepayInter();
	float findExpireMoney();
	List<Interest> findMonthRe();
	List<Interest> findExpireNo();
	List<Interest> findExpireRe();
}
