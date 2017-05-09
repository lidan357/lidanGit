package com.p2p.bean;

import java.io.Serializable;

/**
 * @author Alen1995
 *	用户信息表
 */
public class UserInfo implements Serializable{
	
	private int userID;  //用户编号
	private String userName;  //用户名
	private String password;	//用户密码
	private String email;		//邮箱
	private float balance;	//余额
	private String realName; //真实姓名
	private int age;	//年龄
	private String residence;	//居住地
	private String phone;	//手机号
	private String sex;	//性别
	private String eduExp;	//学历
	private int monthInco;	//月收入
	private String job;	//职业
	private String userIconAddr; //头像地址
	private String status; //状态
	private float redPacket;
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public float getBalance() {
		return balance;
	}
	public void setBalance(float balance) {
		this.balance = balance;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getResidence() {
		return residence;
	}
	public void setResidence(String residence) {
		this.residence = residence;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEduExp() {
		return eduExp;
	}
	public void setEduExp(String eduExp) {
		this.eduExp = eduExp;
	}
	public int getMonthInco() {
		return monthInco;
	}
	public void setMonthInco(int monthInco) {
		this.monthInco = monthInco;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	
	
	public String getUserIconAddr() {
		return userIconAddr;
	}
	public void setUserIconAddr(String userIconAddr) {
		this.userIconAddr = userIconAddr;
	}
	public String getStatus() {
		return status;
	}
	
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	public float getRedPacket() {
		return redPacket;
	}
	public void setRedPacket(float redPacket) {
		this.redPacket = redPacket;
	}
	public UserInfo(String userName, String password, String phone) {
		super();
		this.userName = userName;
		this.password = password;
		this.phone = phone;
	}
	public UserInfo() {
		super();
	}
	
	

}
