package com.p2p.bean;

import java.sql.Date;



/**
 * @author lidan357
 * 借贷评论
 */
public class LoanComm {
	private int comID;//评论编号
	private int loanID;//借贷编号
	private int userID;//用户编号
	private Date comDate;//评论时间
	private String comContent;//评论内容
	public LoanComm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoanComm(int comID, int loanID, int userID, Date comDate,
			String comContent) {
		super();
		this.comID = comID;
		this.loanID = loanID;
		this.userID = userID;
		this.comDate = comDate;
		this.comContent = comContent;
	}
	
	public LoanComm(int loanID, int userID, Date comDate,
			String comContent) {
		super();
		this.loanID = loanID;
		this.userID = userID;
		this.comDate = comDate;
		this.comContent = comContent;
	}
	public int getComID() {
		return comID;
	}
	public void setComID(int comID) {
		this.comID = comID;
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
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	

}
