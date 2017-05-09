package com.p2p.bean;

import java.sql.Date;

public class Washgold {
	private int washID;
	private int userID;
	private Date washDate;
	private int rank;
	private int getMoney;
	private String isFull;
	private String isGet;	
	public int getWashID() {
		return washID;
	}
	public void setWashID(int washID) {
		this.washID = washID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public Date getWashDate() {
		return washDate;
	}
	public void setWashDate(Date washDate) {
		this.washDate = washDate;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getGetMoney() {
		return getMoney;
	}
	public void setGetMoney(int getMoney) {
		this.getMoney = getMoney;
	}
	public String getIsFull() {
		return isFull;
	}
	public void setIsFull(String isFull) {
		this.isFull = isFull;
	}
	public String getIsGet() {
		return isGet;
	}
	public void setIsGet(String isGet) {
		this.isGet = isGet;
	}
	
	

}
