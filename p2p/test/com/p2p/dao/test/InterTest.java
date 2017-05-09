package com.p2p.dao.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;

import com.p2p.bean.Interest;
import com.p2p.bean.Repayment;
import com.p2p.dao.impl.InterestDaoImpl;
import com.p2p.dao.impl.RepaymentDaoImpl;
import com.p2p.util.DateUtil;

public class InterTest {
	@Test
	public void query(){
		InterestDaoImpl inerDao =  new InterestDaoImpl();
		String keywords = " and curMonisre =? and remonre=? ";
		List<Object> params = new ArrayList<Object>();
		HashMap<String,String> orderbys = new HashMap<String,String>();
		//orderbys.put("order by interest", "desc");
		params.add("否");
		params.add(3.33);
		List<Interest> inters = inerDao.queryInterestByCondition(keywords, params, null);
		System.out.println(inters.size());
		for(Interest inter:inters){
			System.out.println(inter);
		}
		
	/*	params.add(3.22);
		params.add(3);
		params.add(new Date());
		Integer i= new Integer(5);
		System.out.println(params.get(0).toString());
		System.out.println(params.get(1).toString());
		System.out.println(params.get(2).toString());
		System.out.println((params.get(0) instanceof Double));*/
		
	}
	
	@Test
	public void testTime(){
		Date date = DateUtil.stringToDate("2016-07-22", "yyyy-MM-dd");
		System.out.println(date.getTime());
		long time1= date.getTime();
		System.out.println("time1: "+time1);
		long  interval = 100*24*60*60*1000l;
		System.out.println("interval: "+interval);
		long time = date.getTime()+interval;
		System.out.println("time: "+time);
		Date date2= new Date(time);
		System.out.println(date2);
		
		
	}
}
