package com.p2p.bean;

import java.sql.Date;

/**
 * 
 * @author Alen1995
 *投资利息
 */
public class InvInter {
	private int interID; //利息编号
	private int loanID; //借贷编号
	private int userID; //用户编号
	private Date getDate; //收息时间
	private Date factGetDate; //实际收息时间
	private String curMonIsGe; //本月是否已收
	private float reMongGe; //本月应收金额
	public InvInter() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InvInter(int interID, int loanID, int userID, Date getDate,
			Date factGetDate, String curMonIsGe, float reMongGe) {
		super();
		this.interID = interID;
		this.loanID = loanID;
		this.userID = userID;
		this.getDate = getDate;
		this.factGetDate = factGetDate;
		this.curMonIsGe = curMonIsGe;
		this.reMongGe = reMongGe;
	}
	public int getInterID() {
		return interID;
	}
	public void setInterID(int interID) {
		this.interID = interID;
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
	public Date getGetDate() {
		return getDate;
	}
	public void setGetDate(Date getDate) {
		this.getDate = getDate;
	}
	public Date getFactGetDate() {
		return factGetDate;
	}
	public void setFactGetDate(Date factGetDate) {
		this.factGetDate = factGetDate;
	}
	public String getCurMonIsGe() {
		return curMonIsGe;
	}
	public void setCurMonIsGe(String curMonIsGe) {
		this.curMonIsGe = curMonIsGe;
	}
	public float getReMongGe() {
		return reMongGe;
	}
	public void setReMongGe(float reMongGe) {
		this.reMongGe = reMongGe;
	}
	
	

}
