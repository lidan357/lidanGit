package com.p2p.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Date;
import java.util.List;

import com.p2p.bean.Invest;
import com.p2p.bean.LoanInfo;
import com.p2p.bean.Repayment;
import com.p2p.bean.UserInfo;
import com.p2p.dao.InvestDao;
import com.p2p.dao.LoanInfoDao;
import com.p2p.dao.RepaymentDao;
import com.p2p.dao.UserInfoDao;
import com.p2p.dao.impl.InvestDaoImpl;
import com.p2p.dao.impl.LoanInfoDaoImpl;
import com.p2p.dao.impl.RepaymentDaoImpl;
import com.p2p.dao.impl.UserInfoDaoImpl;
import com.p2p.service.RepaymentService;
import com.p2p.util.DateUtil;
import com.p2p.util.DbUtil;
import com.p2p.util.PageUtil;

public class RepaymentServiceImpl implements RepaymentService{
	private RepaymentDao repayDao = new RepaymentDaoImpl();
	private LoanInfoDao loanDao = new LoanInfoDaoImpl();
	private UserInfoDao userDao = new UserInfoDaoImpl();
	private InvestDao investDao = new InvestDaoImpl();
	
	
	@Override
	public List<Repayment> findAllRepayMents() {
		
		
		return repayDao.findAllRepayment();
	}

	@Override
	public List<Repayment> findRepayMentsByLoanId(int loanId) {
		return null;
	}

	@Override
	public List<Repayment> findRepayMentsByUserId(int userId) {
		return null;
	}

	@Override
	public boolean repayment(int loanID) {
		boolean bool=false;
		Connection conn = null; 		
		try {
			conn = DbUtil.getConnetion();
			conn.setAutoCommit(false);   //开启事务
			Repayment repayment = repayDao.findRepayment(loanID);
			repayment.setFactRetime(new Date(System.currentTimeMillis()));
			repayment.setStatus("是");
			repayDao.update(repayment);
			
			LoanInfo loanInfo = loanDao.findLoanInfoById(loanID);
			loanInfo.setStatus("完成");
			loanDao.updateLoanInfo(loanInfo);
			
			int userID=loanInfo.getUserID();
			UserInfo user = userDao.findUserInfo(userID);
			user.setBalance(user.getBalance()-loanInfo.getLoanMoney());  //扣除用户余额
			userDao.updateUserInfo(user);
			List<Invest> invests = investDao.findInvestByLoanID(loanID);
			//循环遍历给投资用户还款
			for(Invest invest:invests){
				int uid=invest.getUserID();
				UserInfo u = userDao.findUserInfo(uid);
				u.setBalance(u.getBalance()+invest.getInvMoney());
				userDao.updateUserInfo(u);
			}
			conn.commit();
			bool=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return bool;
	}

	@Override
	public int getCountByCondition(String condition) {
		int count=-1;
			switch(condition){
			case "required":
					count = getRequiredCount();
				break;
			case "finished":
				count = getFinishedCount();
			break;
			case "expired":
				count = getExpireRepayments();
			break;
		
			}
		
		return count;
	}

	private int getFinishedCount() {
		int count = 0;
		List<Repayment> repays = repayDao.findAllRepayment();
		for (Repayment repay:repays){
			if(repay.getStatus()!=null&&repay.getStatus().equals("是"))
			{
				count++;
			}
		}
		
		return count;
	}

	private int getRequiredCount() {
		int count=0;
		List<Repayment> repays = repayDao.findAllRepayment();
		for (Repayment repay:repays){
			if(repay.getStatus()!=null&&repay.getStatus().equals("否"))
			{
				count++;
			}
		}
		return count;
	}

	@Override
	public float requiredRepayMoney() {
		float money =-0.0f;
		List<Repayment> repays = repayDao.findAllRepayment();
		for (Repayment repay:repays){
			if(repay.getStatus()!=null&&repay.getStatus().equals("否"))
			{
				money+=repay.getReqMoney();
			}
		}
		
		return money;
	}
	
	
	public int getExpireRepayments(){
		int count=0;
		List<Repayment> repays = repayDao.findAllRepayment();
		for(Repayment repay:repays){
			LoanInfo loan = 	loanDao.findLoanInfoById(repay.getLoanID());
			long deadLine =(long) loan.getDeadLine()*30*24*60*60*1000;
			Date d = new Date(loan.getLoanDate().getTime()+deadLine);
			String d2 = DateUtil.dateToString(d, "yyyy-MM-dd");
			if(repay.getFactRetime().toString().equals(d2)){
				count++;
			}
		}
		
		return count;
	}

	@Override
	public List<Repayment> findRepayMentsByPage(PageUtil pg) {
		String keyword = " limit "+(pg.getCurPage()-1)*pg.getRowsPrePage()+" , "+pg.getRowsPrePage();
		
		return repayDao.queryRepaymentsByCondition(keyword, null, null);
	}

	@Override
	public int findAllRepayMentsCount() {
		
		return repayDao.findAllRepaymentsCount();
	}

	@Override
	public void generatedRepayPlan(int lid) {
		LoanInfo loan = loanDao.findLoanInfoById(lid);
		Repayment repay = new Repayment();
		repay.setLoanID(loan.getLoanID());
		repay.setFactRetime(null);
		repay.setReDeadTime(loan.getDeadLine());
		repay.setReqMoney(loan.getLoanMoney());
		repay.setUserID(loan.getUserID());
		repay.setStatus("否");
		repayDao.addRepayment(repay);
		
	}

	@Override
	public float findRepayedRepay() {
		String keyword= " and status ='是' ";
		List<Repayment> repays = repayDao.queryRepaymentsByCondition(keyword, null, null);
		float money = 0.0f;
		for (Repayment repay:repays){
			money+=repay.getReqMoney();
		}
		return money;
	}

	@Override
	public float findWaitRepayMoney() {
		String keyword= " and status ='否' ";
		List<Repayment> repays = repayDao.queryRepaymentsByCondition(keyword, null, null);
			float money = 0.0f;
		for (Repayment repay:repays){
			money+=repay.getReqMoney();
		}
		return money;
	}
	
	
	
}
