package com.p2p.dao;

import java.sql.Date;
import java.util.List;

import com.p2p.bean.Washgold;

public interface WashgoldDao {
	boolean addWashgold(Washgold washgold);
	
	boolean updateWashgold(Washgold washgold);
	
	List<Washgold> findWashgoldByUserIDandDate(int userID,Date date);
	
	Washgold findWashgoldByUserIDandDateandRank(int userID,Date date,int rank);
	
	Washgold findWashgoldByWashID(int washID);
	
}
