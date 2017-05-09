package com.p2p.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * @author vAlen199588888
 *	投http://www.svnchina.com/svn/hnaup2p  
 */
public class Invest implements Serializable{
	private int invID;	//投资编号
	private int loanID;	//贷款编号
	private int userID;	//用户编号
	private float invMoney;	//投资金额
	private float totInter;	//总利息
	private float gotInter;	//已或利息
	private Date invDate;
	
	
	
	
	public Invest() {
		super();
	}
	public Invest(int loanID, int userID, float invMoney, float totInter,
			float gotInter, Date invDate) {
		super();
		this.loanID = loanID;
		this.userID = userID;
		this.invMoney = invMoney;
		this.totInter = totInter;
		this.gotInter = gotInter;
		this.invDate = invDate;
	}
	public Date getInvDate() {
		return invDate;
	}
	public void setInvDate(Date invDate) {
		this.invDate = invDate;
	}
	public int getInvID() {
		return invID;
	}
	public void setInvID(int invID) {
		this.invID = invID;
	}
	public int getLoanID() {
		return loanID;
	}
	public void setLoanID(int loanID) {
		this.loanID = loanID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public float getInvMoney() {
		return invMoney;
	}
	public void setInvMoney(float invMoney) {
		this.invMoney = invMoney;
	}
	public float getTotInter() {
		return totInter;
	}
	public void setTotInter(float totInter) {
		this.totInter = totInter;
	}
	public float getGotInter() {
		return gotInter;
	}
	public void setGotInter(float gotInter) {
		this.gotInter = gotInter;
	}
	

}	
