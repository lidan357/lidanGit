package com.p2p.service.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.p2p.bean.Interest;
import com.p2p.bean.InvInter;
import com.p2p.bean.Invest;
import com.p2p.bean.LoanInfo;
import com.p2p.bean.UserInfo;
import com.p2p.dao.InterestDao;
import com.p2p.dao.InvInterDao;
import com.p2p.dao.InvestDao;
import com.p2p.dao.LoanInfoDao;
import com.p2p.dao.UserInfoDao;
import com.p2p.dao.impl.InterestDaoImpl;
import com.p2p.dao.impl.InvInterDaoImpl;
import com.p2p.dao.impl.InvestDaoImpl;
import com.p2p.dao.impl.LoanInfoDaoImpl;
import com.p2p.dao.impl.UserInfoDaoImpl;
import com.p2p.service.InterestService;
import com.p2p.util.DateUtil;
import com.p2p.util.DbUtil;

public class InterestServiceImpl implements InterestService{
	private InterestDao interDao = new InterestDaoImpl();
	private UserInfoDao userDao=new UserInfoDaoImpl();
	private InvestDao invDao=new InvestDaoImpl();
	private InvInterDao invInterDao=new InvInterDaoImpl();
	private LoanInfoDao loanDao = new LoanInfoDaoImpl();
	
	@Override
	public List<Interest> findInterestByLoanId(int id) {
		String keywords = " and loanId = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		HashMap<String,String> orderbys = new HashMap<String,String>();
		orderbys.put(" order by reInterDate ", " asc ");
		// TODO Auto-generated method stub
		return interDao.queryInterestByCondition(keywords, params, orderbys);
	}

	@Override
	public boolean payInterest(int interID) {
		boolean bool=false;
		Interest inter=null;
		LoanInfo loanInfo=null;
		Connection conn =null;
		PreparedStatement pstm=null;
		try {
			conn= DbUtil.getConnetion();
			conn.setAutoCommit(false); //开启事务
			inter=interDao.findInterestByInterID(interID);
			loanInfo=new LoanInfoDaoImpl().findLoanInfoById(inter.getLoanID());
			
			String sql="update interest set curMonIsRe=? where interID=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, "是");
			pstm.setInt(2, interID);
			pstm.executeUpdate();
			int userID=inter.getUserID();
			UserInfo user = userDao.findUserInfo(userID);
			float redPacket = userDao.findRedPacketByUserID(userID);
			float money=redPacket+user.getBalance()-inter.getReMonRe();			
			if(money<0){
				return false;
			}else{
				//减少相应余额
				if(redPacket>=inter.getReMonRe()){
					user.setRedPacket(redPacket-inter.getReMonRe());
				}else{
					user.setRedPacket(0);
					user.setBalance(money);
				}			  
			userDao.updateRedpacket(user); //跟新用户信息
			userDao.updateUserInfo(user);
			//利息分给投资人
			System.out.println(inter.getLoanID());
			List<InvInter> InvInters= invInterDao.findInvInterByLoanID(inter.getLoanID());
			System.out.println(InvInters.size());
			
			for(InvInter invInter:InvInters){
				if(invInter.getGetDate().equals(inter.getReInterDate())){
					System.out.println("true");
					invInter.setCurMonIsGe("是");				
					invInter.setGetDate(inter.getReInterDate());
					invInter.setFactGetDate(new Date(System.currentTimeMillis()));
					invInterDao.updateInvInter(invInter);		//跟新一条获息记录
					UserInfo userInfo=userDao.findUserInfo(invInter.getUserID());
					userInfo.setBalance(userInfo.getBalance()+invInter.getReMongGe());
					Invest invest=invDao.findInvestByLoanIDandUserInfo(inter.getLoanID(),invInter.getUserID());
					System.out.println(invest.getInvID());
					System.out.println(invest.getInvDate());
					System.out.println(invest.getInvMoney()*loanInfo.getInter()/12);
					invest.setGotInter(invest.getGotInter()+invest.getInvMoney()*loanInfo.getInter()/12);
					System.out.println(invDao.updateInvest(invest));	//跟新投资信息
					userDao.updateUserInfo(userInfo);	//跟新投资用户信息
				}
				
			}
			conn.commit(); 
			bool=true;
			}
			
		} catch (SQLException e) {
			bool=false;
			e.printStackTrace();
			return false;
			
		}
		return bool;
	}

	@Override
	public void generatedInterestPlan(int lid) {
		
		LoanInfo loan = loanDao.findLoanInfoById(lid);
		for (int i=1;i<=loan.getDeadLine();i++){
			Interest inv = new Interest();
			inv.setCorMonIsRe("否");
			inv.setFactReDate(null);
			long time1= (long)i*30*24*60*60*1000l;
			long time= loan.getLoanDate().getTime()+time1;
			//Date date= new Date(time);
			inv.setReInterDate(new java.sql. Date(time));
			inv.setLoanID(loan.getLoanID());
			inv.setUserID(loan.getUserID());
			inv.setReMonRe(loan.getLoanMoney()*loan.getInter()/12);
			if(i==1){
				interDao.deleteInerestByLoanId(loan.getLoanID());
			}
			interDao.addInterest(inv);
			}
		
	}

	@Override
	public float findRepayedInter() {
		List<Interest> inters= interDao.findInterestByStatus("是");
		float money =0.0f;
		for(Interest inter:inters){
			money +=inter.getReMonRe();
		}
			return money;
	}

	@Override
	public float findWaitRepayInter() {
		List<Interest> inters= interDao.findInterestByStatus("否");
		float money =0.0f;
		for(Interest inter:inters){
			money +=inter.getReMonRe();
		}
			return money;
	}

	@Override
	public float findExpireMoney() {
		String sql =" select IFNULL(sum(reMonRe),0) from interest where factReDate>reInterDate";
		Object o = interDao.findObject(sql);
		float money=( (Double)o).floatValue();
		DbUtil.CloseAll();
		return money;
	}

	@Override
	//取出最近一个月需要还的贷款
	public List<Interest> findMonthRe() {
		 java.util.Date d = new  java.util.Date(new java.util.Date().getTime()+30*24*60*60*1000l);
		 String strDate = DateUtil.dateToString(d, "yyyy-MM-dd"); 
		 String keyword=" and curMonIsRe='否' and reInterDate>CURDATE() and reInterDate <'"+strDate+"'";
		List<Interest> interest = interDao.queryInterestByCondition(keyword, null, null);
		DbUtil.CloseAll();
		return interest;
	}

	@Override
	public List<Interest> findExpireNo() {
		String keywords =" and curMonIsRe='否' and reInterDate <CURDATE()";
		List<Interest> interests = interDao.queryInterestByCondition(keywords, null, null);
		DbUtil.CloseAll();
		return interests;
	}

	@Override
	public List<Interest> findExpireRe() {
		String keywords=" and curMonIsRe='是' and reInterDate <factReDate ";
		List<Interest> interests = interDao.queryInterestByCondition(keywords, null, null);
		DbUtil.CloseAll();
		return interests;
	}
	
	
}
