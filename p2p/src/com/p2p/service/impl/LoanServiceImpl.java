package com.p2p.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonBeanProcessor;

import com.p2p.bean.LoanInfo;
import com.p2p.bean.UserAllMoney;
import com.p2p.bean.UserInfo;
import com.p2p.dao.InvestDao;
import com.p2p.dao.UserInfoDao;
import com.p2p.dao.impl.InvestDaoImpl;
import com.p2p.dao.impl.LoanInfoDaoImpl;
import com.p2p.dao.impl.UserInfoDaoImpl;
import com.p2p.service.InterestService;
import com.p2p.service.LoanService;
import com.p2p.service.RepaymentService;
import com.p2p.servlet.admin.JSONObject;
import com.p2p.util.DateUtil;
import com.p2p.util.DbUtil;
import com.p2p.util.ExcelFileGenerator;

public class LoanServiceImpl implements LoanService{
	private LoanInfoDaoImpl impl=new LoanInfoDaoImpl();
	private ArrayList<JSONObject> jsons =null;
	private static ArrayList<LoanInfo> loanInfos = new ArrayList<LoanInfo>();
	private InvestDao investDao = new InvestDaoImpl();
			
	@Override
	public List<LoanInfo> findAllLoanInfo() {
		
		return impl.findAllLoanInfo();
	}
	@Override
	public List<LoanInfo> findAllLoanInfo(int curPage, int rowsPrePage) {
		
		return loanInfos=(ArrayList<LoanInfo>) impl.findAllLoanInfo(curPage, rowsPrePage);
	}	@Override
	public int queryMsgCount() {
		// TODO Auto-generated method stub
		return impl.queryMsgCount();
	}
	@Override
	public String findByDeadLine(int deadLineMin, int deadLineMax) {
		
		return impl.findByDeadLine(deadLineMin, deadLineMax);
	}
	//总得到资金
	public int getSUMcurMoney(){
		return impl.getSUMcurMoney();
	}
	//总流动资金
	public int getSUMloanMoney(){
		return impl.getSUMloanMoney();
	}
	
	//取得总人数
	public int getUserAllnumber(){
		UserInfoDaoImpl dao = new UserInfoDaoImpl();
		return dao.getUserAllnumber();
	}
	
	public List<LoanInfo> findByLoanType(String loanType) {
		return impl.findByLoanType(loanType);
	}
	@Override
	public List<LoanInfo> findLoanInfoByUserID(int userID) {
		
		return impl.findLoanInfoByUserID(userID);
	}
	public List<LoanInfo> getFiveLoanInfo(int start,int end){
		return impl.getFiveLoanInfo(start, end);
	}
	public List<UserAllMoney> getFiveUserAllMoney(){
		return impl.getFiveUserAllMoney();
	}
		@Override
	
	//通过id获取到loan 的信息
	public LoanInfo findLoanInfoById(int id) {
		
		return impl.findLoanInfoById(id);
	}
		@Override
		public void updateStatus(int lid, String status) {
			if(status!=null&&status.equals("pass")){
				status = "融资";
			
			}else if(status!=null&&status.equals("giveLoan")){
				status="还款";
			}else if(status!=null&&status.equals("failed")){
				status="流标";
			}
			else{
				status= "审核不通过";
			}
				LoanInfo loanInfo = impl.findLoanInfoById(lid);
				loanInfo.setStatus(status);
				impl.updateLoanInfo(loanInfo);
				//生成还利息计划
				if(status.equals("融资")){
					InterestService invInterService = new InterestServiceImpl();
					invInterService.generatedInterestPlan(lid);
				}
				//生成
				if(status.equals("还款")){
					UserInfoDao userDao = new UserInfoDaoImpl();
					UserInfo user = userDao.findUserInfo(loanInfo.getUserID());
					user.setBalance(user.getBalance()+loanInfo.getLoanMoney());
					userDao.updateUserInfo(user);
					RepaymentService repayService = new RepaymentServiceImpl();
					repayService.generatedRepayPlan(lid);
				}
		}
		@Override
		public JSONArray findStatistic(String staType) {
			JSONArray json = null;
			switch(staType){
			case "weekLoanCount"://最近一个星期的每天贷款笔数
				json=findLoanCountSta("week");
				break;
			case "weekLoanMoney"://最近一个星期的每天贷款金额
				json=findLoanMoneySta("week");
				break;
			case "weekLoanMoney2"://最近一个星期的每天贷款金额
				json=findLoanMoneySta();
				break;
			case "check"://审核 和待审核 已经审核通过的占比
				json=findCheckSta();
				break;
			case "inter"://利息最多排名
				json=findInterSta();
				break;
			case "userCount"://贷款数最多的用户排名
				json=findUserCountSta();
				break;
			case "interBubble"://利率贷款金额 散列图
				json=findinterBubbleSta();
				break;
			case "loanAndInvest"://贷款投资区域图
				json=findloanAndInvestSta();
				break;
			case "monthDeal"://
				json=findTodayDeal();
				break;
			case "aveComplete"://平均满标时间
				json=findAveComplete();
				break;
			case "monthUserCount"://平均满标时间
				json=findmonthUserCount();
				break;
			case "userComp"://每个月的用户贷款用户和投资用户比
				json=findUserComp();
				break;
			}
			
			return json;
		}
		
		
		private JSONArray findUserComp() {
			Calendar calendar = Calendar.getInstance();
			JSONObject lUser = new JSONObject();
			JSONObject iUser = new JSONObject();
			iUser.setPro("投资用户");
			lUser.setPro("贷款用户");
			List<Object> list = new ArrayList<Object>();
			List<Integer> lNums = new ArrayList<Integer>();
			List<Integer> iNums = new ArrayList<Integer>();
			List<String> months = new ArrayList<String>();
			//int mon = calendar.get(Calendar.MONTH);
			for(int i=1;i<=calendar.get(Calendar.MONTH);i++){
				months.add(i+"月");
				String sql = "select IFNULL(count(*),0) from loanInfo where MONTH(LOANDATE)="+i;
				Object o = impl.findObjectBySql(sql);
				int count=0;
				if(o!=null){
					count = ((Double)o).intValue();
				}
				lNums.add(count);
				
				sql = "select IFNULL(count(*),0) from invest where MONTH(INVDATE)="+i;
				o = investDao.findObjectBySql(sql);
				count=0;
				if(o!=null){
					count =((Double)o).intValue();
				}
				iNums.add(count);
				
			}
			iUser.setVal(iNums);
			lUser.setVal(lNums);
			list.add(months);
			list.add(lUser);
			list.add(iUser);
			JsonConfig jsonConfig = new JsonConfig();
            jsonConfig.registerJsonBeanProcessor(java.sql.Date.class, new JsDateJsonBeanProcessor());
            DbUtil.CloseAll();
			return JSONArray.fromObject(list,jsonConfig);
		}
		
		private JSONArray findLoanMoneySta() {
			String sql="SELECT loanDate,IFNULL(SUM(loanMoney),0) FROM loanInfo WHERE DATE_SUB(loanDate, INTERVAL 7 DAY) <= DATE(CURDATE()) "
					+" GROUP BY loanDate";
			List<JSONObject> jsons = impl.findCountBySql(sql);
			List<ArrayList> list = new ArrayList<ArrayList>();
			ArrayList<Object> l1 = new ArrayList<Object>();
			ArrayList<Object> l2 = new ArrayList<Object>();
			for(JSONObject json :jsons){
				Date o =(Date) json.getPro();
				l1.add(DateUtil.dateToString(o, "yyyy-MM-dd"));
				l2.add(json.getVal());
			}
			list.add(l1);
			list.add(l2);
			JsonConfig jsonConfig = new JsonConfig();
            jsonConfig.registerJsonBeanProcessor(java.sql.Date.class, new JsDateJsonBeanProcessor());
			return JSONArray.fromObject(list,jsonConfig);
		}
		private JSONArray findmonthUserCount() {
			List<JSONObject> jList = new ArrayList<JSONObject>();
			JSONObject j1 =new JSONObject();
			Date date = new Date();
			int month = date.getMonth()+1;
			List<Object> o1 = new ArrayList<Object>();
			String sql = "select COUNT(DISTINCT userid) FROM loaninfo WHERE MONTH(loanDate)= ";
			for(int i=0;i<month;i++){
				int count = impl.findCountByKeyword(sql+i);
				o1.add(count);
			}
			j1.setPro("贷款用户");
			j1.setVal(jsons);
			
			JSONObject j2 = new JSONObject();
			List<Object> o2 = new ArrayList<Object>();
			String sql2 = "select COUNT(DISTINCT userid) FROM invest WHERE MONTH(loanDate)= ";
			for(int i=0;i<month;i++){
				int count = impl.findCountByKeyword(sql+i);
				o2.add(count);
			}
			j2.setPro("投资用户");
			j2.setVal(o2);
			jList.add(j1);
			jList.add(j2);
			JsonConfig jsonConfig = new JsonConfig();
            jsonConfig.registerJsonBeanProcessor(java.sql.Date.class, new JsDateJsonBeanProcessor());
            DbUtil.CloseAll();
			return JSONArray.fromObject(jList,jsonConfig);
		}
		private JSONArray findAveComplete() {
			JSONObject json = new JSONObject();
			
			List<Object> list = new ArrayList<Object>();
			List<String> months = new ArrayList<String>();
			List<Float> aveTime = new ArrayList<Float>();
			json.setPro("平均满标时间");
			Date d = new Date();
			for(int i=1;i<=d.getMonth();i++){
				String sql = "SELECT IFNULL(SUM(getLoanTime-loanDate),0) FROM loanInfo WHERE STATUS ='还款' "
						+ "AND MONTH(getLoanTime)= "+i;
				months.add(i+"月");
				Object o = impl.findObjectBySql(sql);
				Float time =0.0f;
				if(o!=null){
					time = Float.parseFloat(o.toString());
				}
			
				sql = "SELECT IFNULL(SUM(getLoanTime-loanDate),0) FROM loanInfo "
						+ "WHERE STATUS ='还款' AND MONTH(getLoanTime)="+i;
				o =  impl.findObjectBySql(sql);
				
				Float count =1.0f;
				if(o!=null&&Float.parseFloat(o.toString())!=0.0f){
					count = Float.parseFloat(o.toString());
				}
				aveTime.add((float)time/count);
			}
			json.setVal(aveTime);
			list.add(months);
			list.add(json);
			   DbUtil.CloseAll();
			return JSONArray.fromObject(list);
		}
		private JSONArray findTodayDeal() {
			String sql= "SELECT getLoanTime ,IFNULL(SUM(loanMoney),0) FROM loanInfo"
					+ " GROUP BY getLoanTime ORDER BY getLoanTime DESC  LIMIT 0,30 ";
			List<JSONObject> jsons =impl.findCountBySql(sql);
			List<ArrayList> list = new ArrayList<ArrayList>();
			//ArrayList<Object> o2 = new ArrayList<Object>();
			for(JSONObject json:jsons){
				ArrayList<Object> o1 = new ArrayList<Object>();
				Date date = (Date)json.getPro();
				o1.add(date.getTime()/1000);
				o1.add(json.getVal());
				list.add(o1);
			}
			return JSONArray.fromObject(list);
		}
		private JSONArray findloanAndInvestSta() {
			List<ArrayList<JSONObject>> list = new ArrayList<ArrayList<JSONObject>>();
			/*String sql = "SELECT DISTINCT loanDate,sum(loanMoney) FROM loanInfo "
					+ " WHERE DATE_SUB(loanDate, INTERVAL 7 DAY) <= DATE(CURDATE())"
					+ " group by loanDate ";
			jsons = (ArrayList<JSONObject>) impl.findCountBySql(sql);
			list.add(jsons);*/
			
			jsons = new ArrayList<JSONObject>();
			List<String> strs = DateUtil.getRecentlySevenDay();
			List<JSONObject> test = null;
			for(String str:strs){
				String sql2="SELECT loanDate,COUNT(*) FROM loanInfo "+
						"WHERE loanDate='"+str+"'";
				test = impl.findCountBySql(sql2);
				if(test.size()==0){
					jsons.add(new JSONObject(str,0));
				}else{
					jsons.add(test.get(0));
				}
			}
			list.add(jsons);
			jsons = new ArrayList<JSONObject>();
			for(String str:strs){
				String sql3 = "SELECT invDate,COUNT(*) FROM invest "
						+" WHERE  invDate = ' " +str+"'";
				test = impl.findCountBySql(sql3);
				if(test.size()==0){
					jsons.add(new JSONObject("",0));
				}else{
					jsons.add(test.get(0));
				}
			}
			list.add(jsons);
			 JsonConfig jsonConfig = new JsonConfig();
	            jsonConfig.registerJsonBeanProcessor(java.sql.Date.class, new JsDateJsonBeanProcessor());
			return JSONArray.fromObject(list,jsonConfig);
		}
	
		private JSONArray findinterBubbleSta() {
			String sql="select inter,loanMoney from loanInfo";
			
			return getJSONArray(sql);
		}
		private JSONArray findUserCountSta() {
			String sql= "SELECT userid ,COUNT(*) c FROM loaninfo WHERE 1=1 GROUP BY userID " 
											+" ORDER BY c DESC LIMIT 0,7 ";
			
			return getJSONArray(sql);
		}
		private JSONArray findInterSta() {
			String sql="SELECT inter ,COUNT(*) c FROM loaninfo WHERE 1=1 GROUP BY inter "
								+" ORDER BY c DESC LIMIT 0,7";
			
			return getJSONArray(sql);
		}
		private JSONArray findCheckSta() {
			String sql="SELECT STATUS ,COUNT(*) c FROM loaninfo WHERE 1=1 GROUP BY STATUS " 
								+" ORDER BY c DESC "	;
			
			return getJSONArray(sql);
		}
	
		private JSONArray findLoanMoneySta(String string) {
			String sql="SELECT loanDate,IFNULL(SUM(loanMoney)) FROM loanInfo WHERE DATE_SUB(loanDate, INTERVAL 7 DAY) <= DATE(CURDATE()) "
								+" GROUP BY loanDate";
		
			
			return getJSONArray(sql);
		}
		private JSONArray findLoanCountSta(String string) {
			String sql="SELECT loanDate,count(*) FROM loanInfo WHERE DATE_SUB(loanDate, INTERVAL 7 DAY) <= DATE(CURDATE())"
								+	" GROUP BY loanDate";
			
			return getJSONArray(sql);
		}
	
		private JSONArray getJSONArray(String sql) {
			 jsons = (ArrayList<JSONObject>) impl.findCountBySql(sql);
			 JsonConfig jsonConfig = new JsonConfig();
	            jsonConfig.registerJsonBeanProcessor(java.sql.Date.class, new JsDateJsonBeanProcessor());
			return JSONArray.fromObject(jsons,jsonConfig);
		}
		@Override
		public JSONArray findWaitApprLoanInfos() {
			String keyword=" and loanMoney=curMoney and status='融资'";
			JsonConfig jsonConfig = new JsonConfig();
			//处理sql date时需要的配置
            jsonConfig.registerJsonBeanProcessor(java.sql.Date.class, new JsDateJsonBeanProcessor());
          
			List<LoanInfo> infos = impl.queryLoanInfoByCondition(keyword ,null,null);
			loanInfos=(ArrayList<LoanInfo>) infos;
			return JSONArray.fromObject(infos,jsonConfig);
		}
		@Override
		public JSONArray getFailedLoanInfos() {
			String d1 = DateUtil.dateToString(new Date(), "yyyy-MM-dd");
			Date d = new Date(DateUtil.stringToDate(d1, "yyyy-MM-dd").getTime()-(long)(7*24*60*60*1000));
			String d2 = DateUtil.dateToString(d, "yyyy-MM-dd");
			String keyword = "and status!='流标' and loanMoney > curMoney and loanDate < '"+d2+"'";
			JsonConfig jsonConfig = new JsonConfig();
			   jsonConfig.registerJsonBeanProcessor(java.sql.Date.class, new JsDateJsonBeanProcessor());
		          
				List<LoanInfo> infos = impl.queryLoanInfoByCondition(keyword ,null,null);
				loanInfos=(ArrayList<LoanInfo>) infos;
				return JSONArray.fromObject(infos,jsonConfig);
		}
		@Override
		public int findLoanUserCount() {
			String keyword = "select  count(distinct userID) from loanInfo";
			return impl.findCountByKeyword(keyword);
		}
		@Override
		public int findLoanCount() {
			
			return impl.findAllLoanInfo().size();
		}
		@Override
		public float findTotLoanMoney() {
			float money = 0.0f;
			List<LoanInfo> infos = impl.findAllLoanInfo();
			for (LoanInfo info: infos){
				
				money+=info.getLoanMoney();
			}

			return money;
		}
		@Override
		public int findFinishedLoan() {
			int count =0;
			List<LoanInfo> infos = impl.findAllLoanInfo();
			for (LoanInfo info: infos){
					if(info.getStatus()!=null&&info.getStatus().equals("完成")){
						count++;
					}
			}
			return count;
		}
		@Override
		public int findCheckingLoan() {
			int count = 0;
			List<LoanInfo> infos = impl.findAllLoanInfo();
			for (LoanInfo info: infos){
					if(info.getStatus()!=null&&info.getStatus().equals("审核")){
						count++;
					}
			}
			return count;
		}
			
		@Override
		public int findFinancingLoan() {
			int count = 0;
			List<LoanInfo> infos = impl.findAllLoanInfo();
			for (LoanInfo info: infos){
					if(info.getStatus()!=null&&info.getStatus().equals("融资")){
						count++;
					}
			}
			return count;
		}
		@Override
		public int findRepayingLoan() {
			int count = 0;
			List<LoanInfo> infos = impl.findAllLoanInfo();
			for (LoanInfo info: infos){
					if(info.getStatus()!=null&&info.getStatus().equals("还款")){
						count++;
					}
			}
			return count;
		}
		@Override
		public int findFailedLoan() {
			int count = 0;
			List<LoanInfo> infos = impl.findAllLoanInfo();
			for (LoanInfo info: infos){
					if(info.getStatus()!=null&&info.getStatus().equals("流标")){
						count++;
					}
			}
			return count;
		}
		@Override
		public int findCountByCondition(String condition) {
			int count=-1;
			switch(condition){
			case "failed":
					count=findFailedLoan();
				break;
			case "finished":
				count=findFinishedLoan();
			break;
			case "checking":
				count=findCheckingLoan();
			break;
			case "financing":
				count=findFinancingLoan();
			break;
			case "repaying":
				count=findRepayingLoan();
			break;
			case "user":
				count=findLoanUserCount();
			break;
			case "total":
				count=findLoanCount();
			break;
		
			}
			return count;
		}
		@Override
		public ExcelFileGenerator getExcel() {
			ArrayList<String> fieldName = getFieldName();
	 		
	 		ArrayList<Object> fieldData= getFieldData();
			
	 		ExcelFileGenerator excel = new ExcelFileGenerator(fieldName, fieldData);
			
			return excel;
		}
		private ArrayList<Object> getFieldData() {
				ArrayList<Object> lines = new ArrayList<Object>();
				for(LoanInfo loanInfo:loanInfos){
						ArrayList<Object> o = new ArrayList<Object>();
						o.add(loanInfo.getLoanID());
						o.add(loanInfo.getUserID());
						o.add(loanInfo.getLoanMoney());
						o.add(loanInfo.getCurMoney());
						o.add(loanInfo.getLoanType());
						o.add(loanInfo.getLoanDate());
						o.add(loanInfo.getInter());
						o.add(loanInfo.getDeadLine());
						o.add(loanInfo.getStatus());
						lines.add(o);
				}
			
			return lines;
		}
		private ArrayList<String> getFieldName() {
			ArrayList<String> names = new ArrayList<String>();
			names.add("贷款id");
			names.add("贷款用户id");
			names.add("贷款金额");
			names.add("当前金额");
			names.add("贷款类型");
			names.add("贷款日期");
			names.add("贷款利率");
			names.add("贷款期限");
			names.add("贷款状态");
			return names;
		}
		@Override
		public float findAverUserLoan() {
			float money = impl.findAverUserLoan();
			
			return money;
		}
		@Override
		public float findAverItemLoan() {
				String sql = "select sum(loanMoney)/count(*) from loanInfo";
				Object o = impl.findObjectBySql(sql);
				float money = ((Double)o).floatValue();
				DbUtil.CloseAll();
				return money;
		}
	

}
