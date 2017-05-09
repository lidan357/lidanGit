package com.p2p.bean;

import java.io.Serializable;

/**
 * @author lidan357
 * 44444JH
 * 管理员信息
 */
public class ManagerInfo implements Serializable{
	private int managerID;//管理员编号
	private String managerName;//管理员名
	private String mPassword;//管理员密码
	private String phone;//电话
	public ManagerInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ManagerInfo(int managerID, String managerName, String mPassword,
			String phone) {
		super();
		this.managerID = managerID;
		this.managerName = managerName;
		this.mPassword = mPassword;
		this.phone = phone;
	}
	public int getManagerID() {
		return managerID;
	}
	public void setManagerID(int managerID) {
		this.managerID = managerID;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

}
