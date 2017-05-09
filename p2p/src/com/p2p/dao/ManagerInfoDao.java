package com.p2p.dao;

import java.util.List;

import com.p2p.bean.ManagerInfo;

public interface ManagerInfoDao {
	public ManagerInfo  checkManagerLogin(String ManName,String password);
	
	public List<ManagerInfo> findAllManagerInfo();
	
	public boolean updateManager(ManagerInfo managerInfo);
	
	public boolean deleteManagerInfo(ManagerInfo managerInfo);
	
	public boolean addManagerInfo(ManagerInfo managerInfo);
	
	
	public ManagerInfo findManagerById(int id);

	public int findAddminCount();

	public List<ManagerInfo> findManagerInfosBySql(String sql);
	
	
	
}
