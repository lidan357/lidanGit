package com.p2p.service;

import com.p2p.bean.Invest;
import com.p2p.util.PageUtil;

import java.util.List;

import net.sf.json.JSONArray;

public interface InvestService {

	List<Invest> findInvestsByLoanId(int id);

	List<Invest> findAllInvests();

	void invest(int lid, int userId, float money);

	List<Invest> findInvestingInfos();
	List<Invest> findInvestedInfos();

	JSONArray findStatistic(String string);
	public int getInvestCount();
	
	public float getTotlInvestMoney();
	
	public int getInvestingCount();
	
	public int getInvestedCount();
	
	public int getInvestUserCount();

	List<Invest> findInvestsByPages(PageUtil pg);

	float getTotalMoneyByUserId(int uid);

	float findAverUserInvest();

	float findAverItemInvest();
	
	float getMoneyByUserandDate(int userID,java.sql.Date date);
}
