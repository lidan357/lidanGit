package com.p2p.service;

import java.util.List;

import com.p2p.bean.LoanComm;

public interface LoanCommService {
	public List<LoanComm> findAllLoanComm();
	List<LoanComm> findLoanCommByLoanId(int id);
	public void addComment(int lid, int uid, String content);
	
}
