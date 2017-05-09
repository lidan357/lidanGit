package com.p2p.dao;

import java.util.HashMap;
import java.util.List;

import com.p2p.bean.IDCardInfo;

public interface IDCardInfoDao {
	/**
	 * 添加一条身份证信息
	 * @param idCardInfo 
	 * @return 是否添加成功
	 */
	public boolean addIDCardInfo(IDCardInfo idCardInfo);
	
	/**
	 * 跟新身份证信息
	 * @param idCardInfo
	 * @return
	 */
	public boolean updateIDCardInfo(IDCardInfo idCardInfo);
	
	public IDCardInfo findIDCardInfo(int idNum);

	public List<IDCardInfo> findAllIdCardInfos();

	public void updateIDCardStatus(String id, String status);

	public IDCardInfo findByUserId(int userID);
	public List<IDCardInfo> queryIDCardInfoByCondition(String keywords,List<Object> params,HashMap<String,String> orderbys);

	public int findIdCardInfoCount();
}
