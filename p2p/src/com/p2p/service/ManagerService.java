package com.p2p.service;

import java.util.List;

import com.p2p.bean.ManagerInfo;
import com.p2p.util.PageUtil;

public interface ManagerService {

	public ManagerInfo  checkManagerLogin(String ManName,String password);
	
	public List<ManagerInfo> findAllManagerInfo();
	
	public boolean updateManager(ManagerInfo managerInfo);
	
	public boolean deleteManagerInfo(ManagerInfo managerInfo);
	
	public boolean addManagerInfo(ManagerInfo managerInfo);
	
	
	public ManagerInfo findManagerById(int id);

	public int findAddminCount();

	public List<ManagerInfo> findAddminByPage(PageUtil pg);
	
	
}
