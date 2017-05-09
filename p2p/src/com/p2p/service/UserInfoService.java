package com.p2p.service;

import java.util.List;

import net.sf.json.JSONArray;

import com.p2p.bean.LoanInfo;
import com.p2p.bean.UserInfo;
import com.p2p.util.PageUtil;

public interface UserInfoService {
	public boolean addUser(UserInfo userInfo);

	public boolean isUserExits(String userName, String phone);

	public UserInfo checkLogin(String loginName, String password);

	public boolean updatePassword(String userName, String newPwd);

	public boolean updateUserInfo(UserInfo userInfo);

	public UserInfo findUserInfoById(int userID);

	public List<UserInfo> findAllUsers();

	public Object findSexStatistic();

	public JSONArray findAgeStatistic();

	public JSONArray findIncomStatistic();

	public JSONArray findEduExpStatistic();
	
	public int getAllUserCount();

	public List<UserInfo> findUsersByPage(PageUtil pg);


}
