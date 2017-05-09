package com.p2p.bean;

import java.io.Serializable;

/**
 * @author Alen1995
 *	身份证信息
 */
public class IDCardInfo implements Serializable{
	private String idNum;	//身份证号
	private int userID; //用户编号
	private String cardPic;	//身份证照
	private String cardPicWithH;  //手持身份证
	private String status;	//状态
	public String getIdNum() {
		return idNum;
	}
	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getCardPic() {
		return cardPic;
	}
	public void setCardPic(String cardPic) {
		this.cardPic = cardPic;
	}
	public String getCardPicWithH() {
		return cardPicWithH;
	}
	public void setCardPicWithH(String cardPicWithH) {
		this.cardPicWithH = cardPicWithH;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
