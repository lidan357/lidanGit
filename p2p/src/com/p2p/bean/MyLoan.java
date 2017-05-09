package com.p2p.bean;

import java.sql.Date;

public class MyLoan {
	private int loanID; //借贷编号
	private int userID;	//用户编号
	private float loanMoney; //贷款金额
	private String loanType; //贷款类型
	private float inter; //利率
	private Date loanDate; // 贷款时间
	private int deadLine; // 贷款期限
	private String descr; //描述
	private Date getLoanTime; //满标时间
	private int curMoney; //已融资金额
	private String status; //状态
	
	private int surLine;	//剩余期限
	
	private int MorID;	//抵押物编号
	private String morType;	//抵押物类型
	private Date buyTime;	//购买时间
	private String morDescr;	//描述
	private String realPic;	//实物图
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
	public float getLoanMoney() {
		return loanMoney;
	}
	public void setLoanMoney(float loanMoney) {
		this.loanMoney = loanMoney;
	}
	public String getLoanType() {
		return loanType;
	}
	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}
	public float getInter() {
		return inter;
	}
	public void setInter(float inter) {
		this.inter = inter;
	}
	public Date getLoanDate() {
		return loanDate;
	}
	public void setLoanDate(Date loanDate) {
		this.loanDate = loanDate;
	}
	public int getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(int deadLine) {
		this.deadLine = deadLine;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public Date getGetLoanTime() {
		return getLoanTime;
	}
	public void setGetLoanTime(Date getLoanTime) {
		this.getLoanTime = getLoanTime;
	}
	public int getCurMoney() {
		return curMoney;
	}
	public void setCurMoney(int curMoney) {
		this.curMoney = curMoney;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getMorID() {
		return MorID;
	}
	public void setMorID(int morID) {
		MorID = morID;
	}
	public String getMorType() {
		return morType;
	}
	public void setMorType(String morType) {
		this.morType = morType;
	}
	public Date getBuyTime() {
		return buyTime;
	}
	public void setBuyTime(Date buyTime) {
		this.buyTime = buyTime;
	}
	public String getMorDescr() {
		return morDescr;
	}
	public void setMorDescr(String morDescr) {
		this.morDescr = morDescr;
	}
	public String getRealPic() {
		return realPic;
	}
	public void setRealPic(String realPic) {
		this.realPic = realPic;
	}
	public int getSurLine() {
		return surLine;
	}
	public void setSurLine(int surLine) {
		this.surLine = surLine;
	}
	
	
}
