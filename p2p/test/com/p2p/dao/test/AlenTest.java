package com.p2p.dao.test;

import java.net.URLEncoder;
import java.sql.Date;

public class AlenTest {
	
	
	public static void main(String[] args) {
		long a =	System.currentTimeMillis();
		System.out.println(a);
		Date d=new Date(System.currentTimeMillis());
		System.out.println(d);
		
		Date dd=new Date(d.getTime()+30*24*60*60*1000);
		System.out.println(dd);
		System.out.println((float)3/2);
	}
}
