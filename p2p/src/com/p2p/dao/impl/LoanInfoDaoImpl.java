package com.p2p.dao.impl;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;







import java.util.Map.Entry;



import com.p2p.bean.LoanComm;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.p2p.bean.Interest;
import com.p2p.bean.LoanInfo;
import com.p2p.bean.MyLoan;
import com.p2p.bean.UserAllMoney;
import com.p2p.dao.LoanInfoDao;
import com.p2p.servlet.admin.JSONObject;
import com.p2p.util.DateUtil;
import com.p2p.util.DbUtil;

public class LoanInfoDaoImpl implements LoanInfoDao {
		
		
	
	@Override
	public int addLoanInfo(LoanInfo loanInfo) {
		int maxID=0;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pre=null;
		
		
			String sql = "insert into loanInfo "
					+ "(userID,loanMoney,loanType,inter,loanDate,deadLine,descr, curMoney,status)"
					+ "values(?,?,?,?,?,?,?,?,?)";
			try {
				pre =  conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				pre.setInt(1, loanInfo.getUserID());
				pre.setFloat(2, loanInfo.getLoanMoney());
				pre.setString(3, loanInfo.getLoanType());
				pre.setFloat(4, loanInfo.getInter());
				pre.setDate(5, loanInfo.getLoanDate());
				pre.setInt(6, loanInfo.getDeadLine());
				pre.setString(7, loanInfo.getDescr());
				pre.setInt(8, loanInfo.getCurMoney());
				pre.setString(9, loanInfo.getStatus());		
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*ArrayList<Object> params=new ArrayList<Object>();
			params.add(loanInfo.getUserID());
			params.add(loanInfo.getLoanMoney());
			params.add(loanInfo.getLoanType());
			params.add(loanInfo.getInter());
			params.add(loanInfo.getLoanDate());
			params.add(loanInfo.getDeadLine());
			params.add(loanInfo.getDescr());
			params.add(loanInfo.getCurMoney());
			params.add(loanInfo.getStatus());*/
			ResultSet rs=null;
			try {
				
				pre.execute();
				rs = pre.getGeneratedKeys();
				if(rs.next()){
					maxID=rs.getInt(1);
				}
						
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
				
		return maxID;
	}

	@Override
	public boolean updateLoanInfo(LoanInfo loanInfo) {
		boolean bool=false;
		String sql = "update loanInfo set "
				+ " getLoanTime=?,curMoney=?,status=? where loanID=? ";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(loanInfo.getLoanDate());
		params.add(loanInfo.getCurMoney());
		params.add(loanInfo.getStatus());
		params.add(loanInfo.getLoanID());
		int count = DbUtil.executeUpdate(sql, params);
		if(count>0){
			bool=true;
		}
		return bool;
	}

	@Override
	public List<LoanInfo> findLoanInfoByUserID(int userID) {
		ArrayList<LoanInfo> list=new ArrayList<LoanInfo>();
		String sql="select * from loanInfo where userID="+userID;
		ResultSet rs = DbUtil.executeQuery(sql, null);
		list=getList(rs,list);
		return list;
	}
	
	@Override
	public List<LoanInfo> findAllLoanInfo() {
		ArrayList<LoanInfo> list=new ArrayList<LoanInfo>();
		String sql="select * from loanInfo";
		ResultSet rs = DbUtil.executeQuery(sql, null);	 
		list=getList(rs, list);
		return list;
	}
	

	@Override
	public List<LoanInfo> findAllLoanInfo(int curPage, int rowsPrePage) {
		ArrayList<LoanInfo> list = new ArrayList<LoanInfo>();
		String sql="select * from loaninfo limit ?,?";
		
		List<Object> params=new ArrayList<Object>();
		params.add((curPage-1)*rowsPrePage);
		params.add(rowsPrePage);
		ResultSet rs=DbUtil.executeQuery(sql, params);
		list=getList(rs,list);
		return list;
		
	}
	
	@Override
	public int queryMsgCount() {
		// TODO Auto-generated method stub
		int count=0;
		String sql="select count(*) from loaninfo";
		ResultSet rs=DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return count;
	}
	
	@Override
	public String findByDeadLine(int deadLineMin,int deadLineMax) {
		ArrayList<MyLoan> list=new ArrayList<MyLoan>();
		String sql="select * from loanInfo l join morgoods m where l.loanID=m.loanID and l.deadLine between "+deadLineMin+" and "+deadLineMax;
		ResultSet rs = DbUtil.executeQuery(sql, null);

		try {
			while(rs.next()){
				MyLoan loanInfo=new MyLoan();
				loanInfo.setLoanID(rs.getInt(1));
				loanInfo.setUserID(rs.getInt(2));
				loanInfo.setLoanMoney(rs.getFloat(3));
				loanInfo.setLoanType(rs.getString(4));
				loanInfo.setInter(rs.getFloat(5));
				loanInfo.setLoanDate(rs.getDate(6));
				loanInfo.setDeadLine(rs.getInt(7));
				loanInfo.setDescr(rs.getString(8));
				loanInfo.setGetLoanTime(rs.getDate(9));
				loanInfo.setCurMoney(rs.getInt(10));
				loanInfo.setStatus(rs.getString(11));
				loanInfo.setMorID(rs.getInt(12));
				loanInfo.setMorType(rs.getString(13));
				loanInfo.setBuyTime(rs.getDate(14));
				loanInfo.setMorDescr(rs.getString(15));
				loanInfo.setRealPic(rs.getString(16));
				int surLine=7-DateUtil.DateToDateDays(new Date(System.currentTimeMillis()), loanInfo.getLoanDate());
				loanInfo.setSurLine(surLine);
				list.add(loanInfo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		System.out.println(list.size());
		ObjectMapper mapper=new ObjectMapper();
		String data=null;
		try {
			data = mapper.writeValueAsString(list);
			System.out.println(data);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
		
	}

	@Override
	public List<LoanInfo> findByStatus(String status) {
		ArrayList<LoanInfo> list=new ArrayList<LoanInfo>();
		String sql="select * from loanInfo where status='"+status+"'";
		ResultSet rs = DbUtil.executeQuery(sql, null);
		list=getList(rs,list);
		return list;
	}

	@Override
	public List<LoanInfo> findByInter(float interMin,float interMax) {
		ArrayList<LoanInfo> list=new ArrayList<LoanInfo>();
		String sql="select * from loanInfo where deadLine between "+interMin+" and "+interMax;
		ResultSet rs = DbUtil.executeQuery(sql, null);
		list=getList(rs,list);
		return list;
	}

	@Override
	public List<LoanInfo> findByLoanType(String loanType) {
		ArrayList<LoanInfo> list=new ArrayList<LoanInfo>();
		String sql="select * from loanInfo where loanType='"+loanType+"'";
		ResultSet rs = DbUtil.executeQuery(sql, null);
		list=getList(rs,list);
		return list;
	}
	
	public ArrayList<LoanInfo> getList(ResultSet rs,ArrayList<LoanInfo> list){
		try {
			while(rs.next()){
				LoanInfo loanInfo=getLoanInfoByResult(rs);
				list.add(loanInfo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return list;
	}
	//求和一共投资了多少资金
	public int getSUMcurMoney(){
		int sumMoney=0;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select SUM(curMoney)as SUMcurMoney from loaninfo";	
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				sumMoney = rs.getInt("SUMcurMoney");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return sumMoney;
	}
	//一共产生多少资金
	public int getSUMloanMoney(){
		int sumMoney=0;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select SUM(loanMoney)as SUMloanMoney from loaninfo";	
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				sumMoney = rs.getInt("SUMloanMoney");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return sumMoney;
	}
	//选出投入资金从高到低的任意条记录
	public List<LoanInfo> getFiveLoanInfo(int start,int end){
		ArrayList<LoanInfo> list = new ArrayList<LoanInfo>();
		String sql="SELECT * from loaninfo where status='融资' and loanMoney>curMoney ORDER BY curMoney desc LIMIT ?,?";
		List<Object> params=new ArrayList<Object>();
		params.add(start);
		params.add(end);
		ResultSet rs=DbUtil.executeQuery(sql, params);
		list=getList(rs,list);
		return list;
	}
	public List<UserAllMoney> getFiveUserAllMoney(){
		ArrayList<UserAllMoney> list=null;
		UserAllMoney bean=null;
		int paiming = 1;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM(SELECT userinfo.userName,SUM(loaninfo.curMoney)as a "+
		"from userinfo,loaninfo where userinfo.userID=loaninfo.userID GROUP BY userName )as b ORDER BY  b.a DESC LIMIT 0,5";
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			list = new ArrayList<UserAllMoney>();	
			while (rs.next()) {
				bean = new UserAllMoney();
				bean.setUserName(rs.getString("userName"));
				bean.setCurMoney(rs.getInt("a"));
				bean.setPaiming(paiming++);
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return list;
	}
	public static void main(String[] args) {
		LoanInfoDaoImpl test = new LoanInfoDaoImpl();
		/*LoanInfo loanInfo = new LoanInfo();
		loanInfo.setUserID(1);
		loanInfo.setLoanMoney(3000000);
		loanInfo.setLoanType("抵押标");
		loanInfo.setInter(0.65f);
		loanInfo.setLoanDate(new Date(System.currentTimeMillis()));
		loanInfo.setDeadLine(5);
		loanInfo.setDescr("测试数据");
		loanInfo.setCurMoney(0);
		loanInfo.setStatus("否");
		System.out.println(test.addLoanInfo(loanInfo));*/
		//List<LoanInfo> list = test.findAllLoanInfo();
		//List<LoanInfo> list=test.findByDeadLine(3, 15);
//		List<LoanInfo> list=test.findByStatus("融资");
//		for(LoanInfo loan:list){
//			System.out.println(loan);
//		}
		/*List<LoanInfo> list=test.findByStatus("融资");
		for(LoanInfo loan:list){
			System.out.println(loan);
			
		}
		List<LoanInfo> list=test.getFiveLoanInfo("curMoney", 0, 5);
		System.out.println(list.size());
		List<UserAllMoney> list = new ArrayList<UserAllMoney>();
		list = test.getFiveUserAllMoney();
		for(UserAllMoney a : list){
			System.out.println(a.getUserName()+a.getCurMoney());
		}*/
			List<LoanInfo> aaa = test.findByLoanType("抵押");
		for(LoanInfo a:aaa){
			System.out.println(aaa);
		}
	}

	@Override
	public LoanInfo findLoanInfoById(int id) {
	String sql ="select * from loaninfo where loanId=?";
	PreparedStatement pre = DbUtil.getPreparedStatement(sql);
	LoanInfo loanInfo =null;
	ResultSet res = null;
	try {
		pre.setInt(1, id);
		res = pre.executeQuery();
		while(res.next()){
			loanInfo = getLoanInfoByResult(res);
		}
	
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally{
		DbUtil.CloseAll();
	}
		
		return loanInfo;
	}

	private LoanInfo getLoanInfoByResult(ResultSet rs) {
		LoanInfo loanInfo = new LoanInfo();
		try {
			loanInfo.setLoanID(rs.getInt(1));
			loanInfo.setUserID(rs.getInt(2));
			loanInfo.setLoanMoney(rs.getFloat(3));
			loanInfo.setLoanType(rs.getString(4));
			loanInfo.setInter(rs.getFloat(5));
			loanInfo.setLoanDate(rs.getDate(6));
			loanInfo.setDeadLine(rs.getInt(7));
			loanInfo.setDescr(rs.getString(8));
			loanInfo.setGetLoanTime(rs.getDate(9));
			loanInfo.setCurMoney(rs.getInt(10));
			loanInfo.setStatus(rs.getString(11));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return loanInfo;
	}

	@Override
	public int userCount(int uid) {
		int count=0;
		String sql="select count(*) from loaninfo where userID="+uid;
		ResultSet rs=DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return count;
	}

	@Override
	public int getSUMloanMoneyByUser(int id) {
		int sumMoney=0;
		Connection conn = DbUtil.getConnetion();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select SUM(loanMoney)as SUMloanMoney from loaninfo where userID="+id;	
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while (rs.next()) {
				sumMoney = rs.getInt("SUMloanMoney");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbUtil.CloseAll();
		}
		return sumMoney;
	}

	@Override
	public int findCountByKeyword(String keyword) {
		String sql ="select count(*) from loanInfo where 1=1 "+keyword;
		if(keyword.contains("select")){
			sql=keyword;
		}
		ResultSet res=DbUtil.getResultSet(sql) ;
		int count=-1;
		try {
			while(res.next()){
				count = res.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		return count;
	}

	@Override
	public  List<JSONObject> findCountBySql(String sql) {
		ResultSet rs= DbUtil.getResultSet(sql);
		List<JSONObject> jsons = new ArrayList<JSONObject>();
		JSONObject json = null;
		try {
			while(rs!=null&&rs.next()){
				json= new JSONObject();
				json.setPro(rs.getObject(1));
				json.setVal(rs.getObject(2));
				jsons.add(json);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		
		return jsons;
	}

	@Override
	public List<LoanInfo> queryLoanInfoByCondition(String keywords,
			List<Object> params, HashMap<String, String> orderbys) {

		String sql ="select * from loanInfo where 1=1 "+keywords;
		List<LoanInfo> infos =  new ArrayList<LoanInfo>();
		LoanInfo info = new LoanInfo();
		if(orderbys!=null&&orderbys.size()>=1){
			for(Entry<String,String> entry : orderbys.entrySet()){
				sql+=" "+entry.getKey()+" "+entry.getValue()+",";
				}
			sql = sql.substring(0, sql.length()-1);
			}
			PreparedStatement pre = DbUtil.getPreparedStatement(sql);
			try {
					if(params!=null&&params.size()>=1){
						for(int i=0;i<params.size();i++){
							if(params.get(i) instanceof Double){
								Double param = (Double)(params.get(i));
									pre.setDouble(i+1,param);
								}else{
									pre.setString(i+1,params.get(i).toString());
								}
						}
							}
					ResultSet res = pre.executeQuery();
					while(res.next()){
						info =  getLoanInfoByResult(res);
						
						infos.add(info);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					}finally{
						DbUtil.CloseAll();
					}
		return infos;
		
		
	}

	@Override
	public int getMaxLoanID() {
		int count=0;
		String sql="select LAST_INSERT_ID() from loaninfo";
		ResultSet rs=DbUtil.executeQuery(sql, null);
		try {
			while(rs.next()){
				
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return count;
	}

	public float findAverUserLoan() {
		String sql = "select sum(loanMoney)/count(distinct userID) from loanInfo";
		ResultSet rs = DbUtil.executeQuery(sql, null);
		float money=0.0f;
		try {
			while(rs.next()){
				money = rs.getFloat(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DbUtil.CloseAll();
		}
		return money;
	}

	public Double findObjectBySql(String sql) {
		DbUtil.CloseAll();
		ResultSet rs = DbUtil.executeQuery(sql, null);
		Double o = null;
		try {
			while(rs!=null&&rs.next()){
					o = rs.getDouble(1);
			}
		}catch(NullPointerException e){
			o=0.0d;
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return o;
	}

	
	
}
