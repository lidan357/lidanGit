package com.p2p.dao;

import java.util.ArrayList;

import com.p2p.bean.Promary;

import com.p2p.bean.City;

public interface PCDao {
	
	ArrayList<Promary> findAll();
	ArrayList<City> findCity(int pid);
	Promary findPromaryByID(int pid);
	City findCityByID(int cid);
}
