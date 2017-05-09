package com.p2p.bean;

import java.io.Serializable;
import java.sql.Date;

/**
 * lllll
 * @author Alen1995
 *	借贷
 */
public class LoanInfo implements Serializable{
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
	@Override
	public String toString() {
		return "LoanInfo [loanID=" + loanID + ", userID=" + userID
				+ ", loanMoney=" + loanMoney + ", loanType=" + loanType
				+ ", inter=" + inter + ", loanDate=" + loanDate + ", deadLine="
				+ deadLine + ", descr=" + descr + ", getLoanTime="
				+ getLoanTime + ", curMoney=" + curMoney + ", status=" + status
				+ "]";
	}
	

}
