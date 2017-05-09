package com.p2p.dao.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;

import com.p2p.bean.Repayment;
import com.p2p.dao.impl.RepaymentDaoImpl;

public class RepayTest {
	@Test
	public void query(){
		RepaymentDaoImpl repayDao =  new RepaymentDaoImpl();
		String keywords = " and status =? and reqmoney=?";
		List<Object> params = new ArrayList<Object>();
		HashMap<String,String> orderbys = new HashMap<String,String>();
		orderbys.put("order by factReTime", "desc");
		params.add("是");
		params.add(200.0);
		List<Repayment> repays = repayDao.queryRepaymentsByCondition(keywords, params, orderbys);
		System.out.println(repays.size());
		for(Repayment repay:repays){
			System.out.println(repay);
		}
		
		
	}
	
	@Test
	public void testAdd(){
		Repayment rep = new Repayment(0, 1, 1, 300.0f,30, new java.sql.Date(new Date().getTime()), "否");
		RepaymentDaoImpl repayDao =  new RepaymentDaoImpl();
		repayDao.addRepayment(rep);
		
	}
	
}
