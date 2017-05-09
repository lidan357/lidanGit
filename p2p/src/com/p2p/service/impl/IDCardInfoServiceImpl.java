package com.p2p.service.impl;

import java.util.List;

import com.p2p.bean.IDCardInfo;
import com.p2p.dao.IDCardInfoDao;
import com.p2p.dao.impl.IDCardInfoDaoImpl;
import com.p2p.service.IDCardInfoService;
import com.p2p.util.PageUtil;

public class IDCardInfoServiceImpl implements IDCardInfoService{
	private IDCardInfoDao  idCardDao= new IDCardInfoDaoImpl();
	
	@Override
	public List<IDCardInfo> findAllIdCardInfos() {
	
		return 	idCardDao.findAllIdCardInfos();
	}

	@Override
	public void updateIDCardStatus(String id, String sta) {
		String status = "";
			if(sta.equals("1")){
				status="是";
			}else{
				status="否";
			}
			
			idCardDao.updateIDCardStatus(id,status);
		
	}

	@Override
	public IDCardInfo findByUserId(int userID) {
		
		
		return idCardDao.findByUserId(userID);
	}

	@Override
	public int waitedForCheck() {
		List<IDCardInfo> infos = idCardDao.findAllIdCardInfos();
		int count=0;
		for (IDCardInfo info:infos){
				if(info.getStatus().equals("否")){
					count++;
				}
		}
		return count;
	}

	@Override
	public int findAllIdCardCount() {
		
		return idCardDao.findIdCardInfoCount();
	}

	@Override
	public List<IDCardInfo> findIdCardInfosByPage(PageUtil pg) {
		String keyword = " limit " +(pg.getCurPage()-1)*pg.getRowsPrePage()+" , "+pg.getRowsPrePage();
		
		return idCardDao.queryIDCardInfoByCondition(keyword, null, null);
	}

	
}
