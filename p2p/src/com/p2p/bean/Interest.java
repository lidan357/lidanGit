package com.p2p.bean;

import java.sql.Date;



/**
 * @author lidan357
 * 贷款利息
 */
public class Interest {
	private int interID;//利息编号
	private int loanID;//借贷编号
	private int userID;// 用户编号
	private Date reInterDate;//还息时间
	private Date factReDate;//实际还款时间
	private String corMonIsRe;//本月是否已还
	private float reMonRe;//本月应还金额
	public Interest() {
		super();
		// TODO Auto-generated constructor stub
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

	public Date getReInterDate() {
		return reInterDate;
	}
	public void setReInterDate(Date reInterDate) {
		this.reInterDate = reInterDate;
	}
	public Date getFactReDate() {
		return factReDate;
	}
	public void setFactReDate(Date factReDate) {
		this.factReDate = factReDate;
	}
	public String getCorMonIsRe() {
		return corMonIsRe;
	}
	public void setCorMonIsRe(String corMonIsRe) {
		this.corMonIsRe = corMonIsRe;
	}
	public float getReMonRe() {
		return reMonRe;
	}
	public void setReMonRe(float reMonRe) {
		this.reMonRe = reMonRe;
	}


	@Override
	public String toString() {
		return "Interest [interID=" + interID + ", loanID=" + loanID
				+ ", userID=" + userID + ", reInterDate=" + reInterDate
				+ ", factReDate=" + factReDate + ", corMonIsRe=" + corMonIsRe
				+ ", reMonRe=" + reMonRe + "]";
	}
	
	

}
