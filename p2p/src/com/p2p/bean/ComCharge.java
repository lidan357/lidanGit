package com.p2p.bean;

import java.sql.Date;

/**
 * l
 * @author lidan357
 */
public class ComCharge {
	private int charID;//手续费编号
	private Date genTime;//时间
	private float money;//金额
	private int loanID;//借贷编号
	public ComCharge() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ComCharge(int charID, Date genTime, float money, int loanID) {
		super();
		this.charID = charID;
		this.genTime = genTime;
		this.money = money;
		this.loanID = loanID;
	}
	public int getCharID() {
		return charID;
	}
	public void setCharID(int charID) {
		this.charID = charID;
	}
	public Date getGenTime() {
		return genTime;
	}
	public void setGenTime(Date genTime) {
		this.genTime = genTime;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public int getLoanID() {
		return loanID;
	}
	public void setLoanID(int loanID) {
		this.loanID = loanID;
	}
	@Override
	public String toString() {
		return "ComCharge [charID=" + charID + ", genTime=" + genTime
				+ ", money=" + money + ", loanID=" + loanID + "]";
	}
	
	

}
