package com.p2p.bean;

import java.sql.Date;

public class Award {
	private int awdID;//奖励编号
	private int userID;//用户编号
	private Date awdDate;//奖励日期
	private int awdMoney;//奖励金额
	private int times;//抽奖次数
	
	public Award() {
		
	}
	
	public Award(int awdID, int userID, Date awdDate, int awdMoney, int times) {
		super();
		this.awdID = awdID;
		this.userID = userID;
		this.awdDate = awdDate;
		this.awdMoney = awdMoney;
		this.times = times;
	}

	public int getAwdID() {
		return awdID;
	}
	public void setAwdID(int awdID) {
		this.awdID = awdID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public Date getAwdDate() {
		return awdDate;
	}
	public void setAwdDate(Date awdDate) {
		this.awdDate = awdDate;
	}
	public int getAwdMoney() {
		return awdMoney;
	}
	public void setAwdMoney(int awdMoney) {
		this.awdMoney = awdMoney;
	}
	public int getTimes() {
		return times;
	}
	public void setTimes(int times) {
		this.times = times;
	}
	


}
