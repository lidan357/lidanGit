package com.p2p.service.impl;

import java.sql.Date;
import java.util.List;

import com.p2p.bean.LoanComm;
import com.p2p.dao.LoanCommDao;
import com.p2p.dao.impl.LoanCommDaoImpl;
import com.p2p.service.LoanCommService;

public class LoanCommServiceImpl implements LoanCommService {
	private LoanCommDao loanCommDao =  new LoanCommDaoImpl();
	
	@Override
	public List<LoanComm> findAllLoanComm() {
		
		return loanCommDao.findAllLoanComm();
	}

	@Override
	public List<LoanComm> findLoanCommByLoanId(int id) {
		return loanCommDao.findLoanComm(id);
	}

	@Override
	public void addComment(int lid, int uid, String content) {
		List<LoanComm> comms = findAllLoanComm();
		LoanComm loanComm = new LoanComm(lid,uid,new Date(new java.util.Date().getTime()),content);
		for(LoanComm comm :comms){
			if(comm.getUserID()==loanComm.getUserID()&&comm.getLoanID()==loanComm.getLoanID()){
				return;
			}
		}
			loanCommDao.addLoanComm(loanComm);
	}

}
