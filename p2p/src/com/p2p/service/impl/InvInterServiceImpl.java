package com.p2p.service.impl;

import java.util.List;

import com.p2p.bean.InvInter;
import com.p2p.bean.Invest;
import com.p2p.bean.LoanInfo;
import com.p2p.dao.InvInterDao;
import com.p2p.dao.InvestDao;
import com.p2p.dao.LoanInfoDao;
import com.p2p.dao.impl.InvInterDaoImpl;
import com.p2p.dao.impl.InvestDaoImpl;
import com.p2p.dao.impl.LoanInfoDaoImpl;
import com.p2p.service.InvInterService;

public class InvInterServiceImpl implements InvInterService{
		private InvInterDao invInterDao = new InvInterDaoImpl();
		private LoanInfoDao loanDao= new LoanInfoDaoImpl();
		private InvestDao investDao = new InvestDaoImpl();
		
		@Override
		public void generatedInterPlan(int loanId,int invId) {
			Invest invest = investDao.findInvestById(invId);
			LoanInfo loan = loanDao.findLoanInfoById(loanId);
			for (int i=1;i<=loan.getDeadLine();i++){
				InvInter inv = new InvInter();
				inv.setCurMonIsGe("否");
				inv.setFactGetDate(null);
				long time1= (long)i*30*24*60*60*1000;
				long time= loan.getLoanDate().getTime()+time1;
				inv.setGetDate(new java.sql. Date(time));
				inv.setLoanID(loan.getLoanID());
				inv.setUserID(invest.getUserID());
				inv.setReMongGe(invest.getInvMoney()*loan.getInter()/12);
				if(i==1){
					invInterDao.deleteByUserIdAndLoanId(inv.getUserID(),inv.getLoanID());
				}
				invInterDao.addInvInter(inv);
			}
			
		}

		@Override
		public Float findGotInterest() {
			List<InvInter>invInters = invInterDao.findInvInterByStatus("是");
			float money = 0.0f;
			for(InvInter inv:invInters){
				money+=inv.getReMongGe();
			}
			
			return money;
		}

	
}
