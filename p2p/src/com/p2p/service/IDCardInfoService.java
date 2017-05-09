package com.p2p.service;

import java.util.List;

import com.p2p.bean.IDCardInfo;
import com.p2p.util.PageUtil;

public interface IDCardInfoService {

	List<IDCardInfo> findAllIdCardInfos();

	void updateIDCardStatus(String id, String status);

	IDCardInfo findByUserId(int userID);

	public int waitedForCheck();

	int findAllIdCardCount();

	List<IDCardInfo> findIdCardInfosByPage(PageUtil pg);
	
	
}
