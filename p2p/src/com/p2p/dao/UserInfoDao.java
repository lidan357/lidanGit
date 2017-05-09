package com.p2p.dao;

import java.util.List;

import com.p2p.bean.UserInfo;

/**
 * @author lidan357
 *
 */
public interface UserInfoDao {
	/**
	 * 添加一条用户信息
	 * @param userInfo 用户信息实体
	 * @return	添加成功返回true，添加失败返回false
	 */
	public boolean addUserInfo(UserInfo userInfo);  
	
	/**
	 * 更新用户信息
	 * @param userInfo 用户信息实体
	 * @return	是否更新成功
	 */
	public boolean updateUserInfo(UserInfo userInfo);
	
	/**
	 * 根据用户编号查找用户信息
	 * @param UserID 用户编号
	 * @return	一条用户信息实体
	 */
	public UserInfo findUserInfo(int userID);
	
	/**
	 * 根据用户编号查找用户信息
	 * @param userName 用户名
	 * @param phone 手机号码
	 * @return	一条用户信息实体
	 */
	public UserInfo findUserInfo(String userName,String phone);
	
	/**
	 * 查询所有用户信息
	 * @return  用户信息实体集合
	 */
	
	public List<UserInfo> findAllUserInfo();

	public UserInfo getUserInfoById(int userID);

	public int getCountByCondition(String keyword);
	
	public int getUserAllnumber();

	public List<UserInfo> findUsersBySql(String sql);
		
	public float findRedPacketByUserID(int userID);
	
	public boolean updateRedpacket(UserInfo userInfo);
}
