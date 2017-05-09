package com.p2p.service.impl;

import java.util.List;

import com.p2p.bean.ManagerInfo;
import com.p2p.dao.ManagerInfoDao;
import com.p2p.dao.impl.ManagerInfoDaoImpl;
import com.p2p.service.ManagerService;
import com.p2p.util.MD5keyBean;
import com.p2p.util.PageUtil;

public class ManagerServiceImpl implements ManagerService {

	private ManagerInfoDao managerDao = new ManagerInfoDaoImpl();
	@Override
	public ManagerInfo checkManagerLogin(String ManName, String password) {
		MD5keyBean md5 = new MD5keyBean();
		/*if(password!=null){
			password=md5.getkeyBeanofStr(password);
		}*/
		return managerDao.checkManagerLogin(ManName, password);
	}

	@Override
	public List<ManagerInfo> findAllManagerInfo() {
		return null;
	}

	@Override
	public boolean updateManager(ManagerInfo managerInfo) {
		
		return managerDao.updateManager(managerInfo);
	}

	@Override
	public boolean deleteManagerInfo(ManagerInfo managerInfo) {
		managerDao.deleteManagerInfo(managerInfo);
		return false;
	}

	@Override
	public boolean addManagerInfo(ManagerInfo managerInfo) {
		
		return managerDao.addManagerInfo(managerInfo);
	}

	@Override
	public ManagerInfo findManagerById(int id) {
		return managerDao.findManagerById(id);
	}

	@Override
	public int findAddminCount() {
		return managerDao.findAddminCount();
	}

	@Override
	public List<ManagerInfo> findAddminByPage(PageUtil pg) {
		String sql = "select * from managerinfo limit "+(pg.getCurPage()-1)*pg.getRowsPrePage()+" , "+pg.getRowsPrePage();
		
		return managerDao.findManagerInfosBySql(sql);
	}

	
	
}
