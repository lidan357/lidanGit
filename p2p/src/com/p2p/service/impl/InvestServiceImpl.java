package com.p2p.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;

import com.p2p.bean.Invest;
import com.p2p.bean.LoanInfo;
import com.p2p.dao.InvestDao;
import com.p2p.dao.LoanInfoDao;
import com.p2p.dao.impl.InvestDaoImpl;
import com.p2p.dao.impl.LoanInfoDaoImpl;
import com.p2p.service.InvInterService;
import com.p2p.service.InvestService;
import com.p2p.servlet.admin.JSONObject;
import com.p2p.util.DateUtil;
import com.p2p.util.PageUtil;

public class InvestServiceImpl implements InvestService{
	private InvestDao  investDao = new InvestDaoImpl();
	private LoanInfoDao loanDao = new LoanInfoDaoImpl();
	
	@Override
	public List<Invest> findInvestsByLoanId(int id) {
			
		return investDao.findInvestByLoanID(id);
	}
	@Override
	public List<Invest> findAllInvests() {
		return investDao.queryInvestByCondition(" ", null, null);
	}
	@Override
	public void invest(int lid, int userId, float money) {
		LoanInfo loan = loanDao.findLoanInfoById(lid);
		loan.setCurMoney(loan.getCurMoney()+(int)money);
		Date date = new Date();
		float totInter = loan.getInter()*money;
		Invest inv = new Invest(lid, userId, money, totInter, 0.0f, date);
		loanDao.updateLoanInfo(loan);
		int id = investDao.addInvest(inv);
		InvInterService invService = new InvInterServiceImpl();
		invService.generatedInterPlan(lid,id);
		
		
		
	}
	@Override
	public List<Invest> findInvestingInfos() {
		String keywords = " and gotInter < totInter";
		return investDao.queryInvestByCondition(keywords, null, null);
	}
	@Override
	public List<Invest> findInvestedInfos() {
		String keywords = " and gotInter = totInter";
		return investDao.queryInvestByCondition(keywords, null, null);
	}
	@Override
	public JSONArray findStatistic(String type) {
		JSONArray json = null;
		switch(type){
		case  "weekInv":
			json= findWeekInvSta();
					break;
		case "inter":
			json = findInterSta();
			break;
		case "moneyInv":
			json = findMoneyInvRankSta();
			break;
		case "userInv":
			json = findUserInvRankSta();
			break;
		
		}
		return json;
	}
	private JSONArray findUserInvRankSta() {
		String sql = " select userid,sum(invMoney) from invest group by userid "
				+ " order by sum(invMoney) desc limit 0,7";
		List<JSONObject> jsons = investDao.findInvestBySql(sql);
		String sql2 =  " select userid,count(*) from invest group by userid "
					+ " order by count(*) desc limit 0,7";
		List<JSONObject> json2 = investDao.findInvestBySql(sql2);
		List<List> list = new ArrayList<List>();
		 list.add(jsons);
		 list.add(json2);
		return JSONArray.fromObject(list);
	}
	private JSONArray findMoneyInvRankSta() {
		String sql = " order by invMoney desc limit 0,7 ";
		List<Invest> invs = investDao.queryInvestByCondition(sql, null, null);
		List<JSONObject> jsons = new ArrayList<JSONObject>();
		int i=1;
		for(Invest inv:invs){
			JSONObject json = new JSONObject();
			json.setVal(inv.getInvMoney());
			json.setPro("第"+i+"名 "+inv.getUserID()+"(用户id)");
			jsons.add(json);
			i++;
		}
		
		return JSONArray.fromObject(jsons);
	}
	private JSONArray findInterSta() {
		List<Object> list1 = new ArrayList<Object>();
		list1.add("利息还完");
		List<Invest> invs1 = investDao.queryInvestByCondition(" and totInter=gotInter ",null,null);
		list1.add(invs1.size());
		
		List<Object> list2 = new ArrayList<Object>();
		list2.add("利息正在还");
		List<Invest> invs2 = investDao.queryInvestByCondition(" and totInter>gotInter and gotInter !=0 ",null,null);
		list2.add(invs2.size());
		
		List<Object> list3 = new ArrayList<Object>();
		list3.add("利息还未开始还");
		List<Invest> invs3 = investDao.queryInvestByCondition(" and gotInter=0",null,null);
		list3.add(invs3.size());
		List<List> list = new ArrayList<List>();
		list.add(list1);
		list.add(list2);
		list.add(list3);
		JSONObject json = new JSONObject();
		json.setPro("利息各项比例");
		json.setVal(list);
		
		return JSONArray.fromObject(json);
	}
	private JSONArray findWeekInvSta() {
		/**
		 * [
		 * 		{
            		name: 'Tokyo',
            		data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        		}
        	]
		 */
		List<List> list = new ArrayList<List>();
		String sql = "select invDate,sum(invMoney) from invest where invDate='";
		list.add(getRecentlyStatistic(sql,"投资金额"));
		sql = "select invDate,count(*)  from invest where  invDate='";
		list.add(getRecentlyStatistic(sql, "投资笔数"));
		
		/**
		 * 以上是获得一个星期投资金额的数据
		 */
		return JSONArray.fromObject(list);
	}
	public List<JSONObject> getRecentlyStatistic(String sql,String name){
		/**json 格式
		 * [
		 * 		{
            		name: 'Tokyo',
            		data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        		}
        	]
		 */
		List<String> dates = DateUtil.getRecentlySevenDay();
		String sql1=sql;
		JSONObject json_parent = new JSONObject();//相当于大括号里面的东西
		List<Object> vals =  new ArrayList<Object>();
		JSONObject json_child = null;//只是为了获取那个值
		for (String str:dates){
			sql1+=str+"'";
			json_child = investDao.findCountBySql(sql1);
			if(json_child.getVal()==null){
				vals.add(0);
			}else{
				vals.add(json_child.getVal());
			}
			sql1=sql;
		}
		json_parent.setVal(vals);
		json_parent.setPro(name);
		List<JSONObject> jsons1 = new ArrayList<JSONObject>();
		jsons1.add(json_parent);
		return jsons1;
	}
	
	public int getInvestCount(){
		List<Invest> invest = investDao.queryInvestByCondition("", null, null);
		
		
		return invest.size();
	}
	
	public float getTotlInvestMoney(){
		List<Invest> invests = investDao.queryInvestByCondition("", null, null);
		float money = 0.0f;
		for(Invest inv:invests){
			money+=inv.getInvMoney();
			
		}
		
		return money;
	}
	
	public int getInvestingCount(){
		int counting=0;
		List<Invest> invests = investDao.queryInvestByCondition("", null, null);
		for(Invest inv:invests){

			if(inv.getTotInter()>inv.getGotInter()){
				counting++;
			}
		}
		
		return counting;
	}
	
	public int getInvestedCount(){
		int count=0;
		List<Invest> invests = investDao.queryInvestByCondition("", null, null);
		for(Invest inv:invests){

			if(inv.getTotInter()==inv.getGotInter()){
				count++;
			}
		}
		
		return count;
	}
	@Override
	public int getInvestUserCount() {
		
		return investDao.findInvestUserCount();
	}
	@Override
	public List<Invest> findInvestsByPages(PageUtil pg) {
		String keyword = " limit "+(pg.getCurPage()-1)*pg.getRowsPrePage()+" , "+pg.getRowsPrePage();
		
		return investDao.queryInvestByCondition(keyword, null, null);
	}
	@Override
	public float getTotalMoneyByUserId(int uid) {
		
		List<Invest> invests=investDao.findInvestByUserID(uid);
		float money = 0.0f;
		for(Invest inv:invests){
			money+=inv.getInvMoney();
		}
		return money;
	}

	@Override
	public float findAverUserInvest() {
		int userCount = investDao.findInvestUserCount();
		float money = investDao.findAllInvestMoney();
		
		
		return (float)money/userCount;
	}
	@Override
	public float findAverItemInvest() {
		float money = investDao.findAllInvestMoney();
		int count = investDao.findInvestCount();
		
		return (float)money/count;
	}

	@Override
	public float getMoneyByUserandDate(int userID,java.sql.Date date) {
		return 	new InvestDaoImpl().getMoneyByUserandDate(userID,date);		
	}

	
	
	
}
