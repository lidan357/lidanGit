package com.p2p.servlet.admin;

public class JSONObject {
	private Object pro;
	private Object val;
	public Object getPro() {
		return pro;
	}
	public void setPro(Object pro) {
		this.pro = pro;
	}
	public Object getVal() {
		return val;
	}
	public void setVal(Object val) {
		this.val = val;
	}
	public JSONObject(Object pro, Object val) {
		super();
		this.pro = pro;
		this.val = val;
	}
	public JSONObject() {
		super();
	}
	
	
}
