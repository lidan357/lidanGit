package com.p2p.bean;

import java.io.Serializable;
import java.sql.Date;

/**
 * @author lidan357
 * 还款
 */
public class Repayment implements Serializable{
	private int reID;//还款编号
	private int loanID;//借贷编号
	private int userID;//用户编号（贷款人）
	private float reqMoney;//应还金额
	private int reDeadTime;//还款期限
	private Date factRetime;//实际还款时间
	private String status;  //状态
	public Repayment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Repayment(int reID, int loanID, int userID, float reqMoney,
			int reDeadTime, Date factRetime, String status) {
		super();
		this.reID = reID;
		this.loanID = loanID;
		this.userID = userID;
		this.reqMoney = reqMoney;
		this.reDeadTime = reDeadTime;
		this.factRetime = factRetime;
		this.status = status;
	}



	public int getReID() {
		return reID;
	}
	public void setReID(int reID) {
		this.reID = reID;
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

	public float getReqMoney() {
		return reqMoney;
	}
	public void setReqMoney(float reqMoney) {
		this.reqMoney = reqMoney;
	}
	public int getReDeadTime() {
		return reDeadTime;
	}
	public void setReDeadTime(int reDeadTime) {
		this.reDeadTime = reDeadTime;
	}
	public Date getFactRetime() {
		return factRetime;
	}
	public void setFactRetime(Date factRetime) {
		this.factRetime = factRetime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "Repayment [reID=" + reID + ", loanID=" + loanID + ", userID="
				+ userID + ", reqMoney=" + reqMoney + ", reDeadTime="
				+ reDeadTime + ", factRetime=" + factRetime + ", status="
				+ status + "]";
	}
	
	

}
