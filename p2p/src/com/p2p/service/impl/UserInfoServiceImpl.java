package com.p2p.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;

import com.p2p.bean.UserInfo;
import com.p2p.dao.UserInfoDao;
import com.p2p.dao.impl.UserInfoDaoImpl;
import com.p2p.service.UserInfoService;
import com.p2p.servlet.admin.JSONObject;
import com.p2p.util.MD5keyBean;
import com.p2p.util.PageUtil;

public class UserInfoServiceImpl implements UserInfoService{
	private UserInfoDao userInfoDao = new UserInfoDaoImpl();
	private MD5keyBean md5 = new MD5keyBean();
	private ArrayList<JSONObject> sta = new ArrayList<JSONObject>();
	public boolean addUser(UserInfo userInfo){
		if(userInfo!=null&&userInfo.getPassword()!=null&&!userInfo.getPassword().equals("")){
			userInfo.setPassword(md5.getkeyBeanofStr(userInfo.getPassword()));
		}
		return userInfoDao.addUserInfo(userInfo);
	}

	@Override
	public boolean isUserExits(String userName, String phone) {
		UserInfo userInfo = userInfoDao.findUserInfo(userName, phone);
		if(userInfo==null){
			return false;
		}
		return true;
		
	}

	/**
	 *检查用户的登录是否合法
	 *因为用户可能使用手机号码 也有可能使用用户名登录
	 *所以需要判断用户使用的是哪一个字段
	 *如果是手机号码则通过手机号码 把用户查询出来 然后来查看密码是否正确
	 *如果使用的是用户名 则使用用户名吧用户加载出来  然后来查看密码是否正确
	 *如果正确 则返回这个对象 因为要放入session当中去
	 *如果不正确就返回null
	 *author chenyong
	 */
	@Override
	public UserInfo checkLogin(String loginName, String password) {
		UserInfo userInfo=null;
		password = md5.getkeyBeanofStr(password);//使用MD5加密算法 对密码进行加密
		if(isPhone(loginName)){
			userInfo=userInfoDao.findUserInfo(null, loginName);
		}else{
			userInfo=userInfoDao.findUserInfo(loginName, null);
		}
		
		if(userInfo!=null&&password!=null&&password.equals(userInfo.getPassword())){
			return userInfo;
		}
		
		return null;
	}
	
	
	/**
	 * 判断输入的字符串是不是一个手机号码
	 * @param str
	 * @return
	 */
	public boolean isPhone(String str){
	if(str!=null&&!str.equals("")&&str.length()==11){
		Pattern p = Pattern.compile("^[1][358][0-9]{9}$");
		Matcher m = p.matcher(str);
		return m.matches();
		}
		return false;
	}


	@Override
	/**
	 *修改密码 
	 *chenyong 修改 2016082116：49
	 */
	public boolean updatePassword(String phone, String newPwd) {
		newPwd = md5.getkeyBeanofStr(newPwd);
		UserInfo userInfo = userInfoDao.findUserInfo(null, phone);
		userInfo.setPassword(newPwd);
		return userInfoDao.updateUserInfo(userInfo);
		
	}
	@Override
	public boolean updateUserInfo(UserInfo userInfo) {
		return userInfoDao.updateUserInfo(userInfo);
	}

	@Override
	public UserInfo findUserInfoById(int userID) {
		
		
		return userInfoDao.getUserInfoById(userID);
	}

	@Override
	public List<UserInfo> findAllUsers() {
		return userInfoDao.findAllUserInfo();
	}

	@Override
	public Object findSexStatistic() {
		String keyword = " and sex='男'";
		String keyword2 = " and sex='女'";
		int m_count = userInfoDao.getCountByCondition(keyword);
		int f_count = userInfoDao.getCountByCondition(keyword2);
		List<JSONObject> sta = new ArrayList<JSONObject>();
		sta.clear();
		sta.add(new JSONObject("男",m_count));
		sta.add(new JSONObject("女",f_count));
		/*sta.put("sex", "女");
		sta.put("count", f_count);*/
		JSONArray array = JSONArray.fromObject(sta);
		
		return array;
	}

	@Override
	public JSONArray findAgeStatistic() {
		String f_keyword = " and age<30 ";
		String s_keyword = " and age>=30 and age<50  ";
		String t_keyword = " and age>=50   ";
		int f_count = userInfoDao.getCountByCondition(f_keyword);
		int s_count = userInfoDao.getCountByCondition(s_keyword);
		int t_count = userInfoDao.getCountByCondition(t_keyword);
		sta.clear();
		sta.add(new JSONObject("小于30岁",f_count));
		sta.add(new JSONObject("30岁到50岁",s_count));
		sta.add(new JSONObject("大于50岁",t_count));
		
		return JSONArray.fromObject(sta);
	}

	@Override
	public JSONArray findIncomStatistic() {
		String f_keyword = " and monthInco <5000";
		String s_keyword = " and monthInco >=5000 and monthInco <10000 ";
		String t_keyword = " and monthInco >=10000 and monthInco < 50000 ";
		String fo_keyword = " and monthInco >50000";
		int f_count = userInfoDao.getCountByCondition(f_keyword);
		int s_count = userInfoDao.getCountByCondition(s_keyword);
		int t_count = userInfoDao.getCountByCondition(t_keyword);
		int fo_count = userInfoDao.getCountByCondition(fo_keyword);
		sta.clear();
		sta.add(new JSONObject("低于5000",f_count));
		sta.add(new JSONObject("5000至10000",s_count));
		sta.add(new JSONObject("10000至50000",t_count));
		sta.add(new JSONObject("50000以上",fo_count));
		
		return JSONArray.fromObject(sta);
		
		
	}

	@Override
	public JSONArray findEduExpStatistic() {
		String f_keyword = " and eduExp='高中'";
		String s_keyword = " and eduExp='高中以下' ";
		String t_keyword = " and eduExp='专科'";
		String fo_keyword = " and eduExp='本科'";
		String fi_keyword = " and eduExp='本科以上'";
		int f_count = userInfoDao.getCountByCondition(f_keyword);
		int s_count = userInfoDao.getCountByCondition(s_keyword);
		int t_count = userInfoDao.getCountByCondition(t_keyword);
		int fo_count = userInfoDao.getCountByCondition(fo_keyword);
		int fi_count = userInfoDao.getCountByCondition(fi_keyword);
		sta.clear();
		sta.add(new JSONObject("高中",f_count));
		sta.add(new JSONObject("高中以下",s_count));
		sta.add(new JSONObject("专科",t_count));
		sta.add(new JSONObject("本科",fo_count));
		sta.add(new JSONObject("本科以上",fi_count));
		
		return JSONArray.fromObject(sta);
	}

	@Override
	public int getAllUserCount() {
		
		return userInfoDao.getUserAllnumber();
	}

	@Override
	public List<UserInfo> findUsersByPage(PageUtil pg) {
		String sql = "select * from userInfo limit "+(pg.getCurPage()-1)*pg.getRowsPrePage()+" , "+pg.getRowsPrePage();
		
		return userInfoDao.findUsersBySql(sql);
	}
	
	
	
}
