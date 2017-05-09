package com.p2p.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.p2p.util.DbUtil;
import com.p2p.bean.City;
import com.p2p.bean.Promary;
import com.p2p.dao.PCDao;

public class PCDaoImpl implements PCDao{

	@Override
	public ArrayList<Promary> findAll() {
		ArrayList<Promary> list=new ArrayList<Promary>();
		String sql="select * from promary";
		ResultSet res=DbUtil.executeQuery(sql, null);
		try {
			while(res.next()){
				Promary p=new Promary();
				p.setPid(res.getInt(1));
				p.setpName(res.getString(2));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ArrayList<City> findCity(int pid) {
		ArrayList<City> list=new ArrayList<City>();
		String sql="select * from city where pid=?";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(pid);
		ResultSet res= DbUtil.executeQuery(sql, params);
		try {
			while(res.next()){
				City city=new City();
				city.setCid(res.getInt(1));
				city.setcName(res.getString(2));
				city.setPid(pid);
				list.add(city);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Promary findPromaryByID(int pid) {
		String sql="select * from promary where pid=?";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(pid);
		ResultSet res= DbUtil.executeQuery(sql, params);
		Promary pro=new Promary();
		try {
			while(res.next()){
				pro.setPid(pid);
				pro.setpName(res.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pro;
	}

	@Override
	public City findCityByID(int cid) {
		String sql="select * from city where cid=?";
		ArrayList<Object> params=new ArrayList<Object>();
		params.add(cid);
		ResultSet res= DbUtil.executeQuery(sql, params);
		City city=new City();
		try {
			while(res.next()){
				city.setCid(res.getInt(1));
				city.setcName(res.getString(2));
				city.setPid(res.getInt(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return city;
	}

}
