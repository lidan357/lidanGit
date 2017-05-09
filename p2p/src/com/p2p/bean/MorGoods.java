package com.p2p.bean;

import java.sql.Date;

/**
 * @author Alen1995
 *	抵押物
 */
public class MorGoods {
	private int MorID;	//抵押物编号
	private String morType;	//抵押物类型
	private Date buyTime;	//购买时间
	private String descr;	//描述
	private String realPic;	//实物图
	private int loanID;	//贷款编号
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
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getRealPic() {
		return realPic;
	}
	public void setRealPic(String realPic) {
		this.realPic = realPic;
	}
	public int getLoanID() {
		return loanID;
	}
	public void setLoanID(int loanID) {
		this.loanID = loanID;
	}
	
}
