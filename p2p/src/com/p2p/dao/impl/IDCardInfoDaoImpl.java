package com.p2p.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import com.p2p.bean.IDCardInfo;
import com.p2p.bean.Interest;
import com.p2p.dao.IDCardInfoDao;
import com.p2p.util.DbUtil;

public class IDCardInfoDaoImpl implements IDCardInfoDao {

	@Override
	public boolean  addIDCardInfo(IDCardInfo idCardInfo) {
		boolean flag = false;
		int count = 0;
		String sql = "insert into idcardinfo(cardPic,userID,cardPicWithH,status,idNum) values(?,?,?,?,?)";
		
		count = getCount(idCardInfo,sql);
		if(count>0){
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean updateIDCardInfo(IDCardInfo idCardInfo) {
		boolean flag = false;
		int count = 0;
		String sql = "update idcardinfo set cardPic=?,idNum=?,cardPicWithH=?,status=? where userID=?";
		List<Object> params = new ArrayList<Object>();
		params.add(idCardInfo.getCardPic());
		params.add(idCardInfo.getIdNum());
		params.add(idCardInfo.getCardPicWithH());
		params.add(idCardInfo.getStatus());
		params.add(idCardInfo.getUserID());
		count = DbUtil.executeUpdate(sql, params);
		if(count>0){
			flag = true;
		}
		return flag;
	}

	@Override
	public IDCardInfo findIDCardInfo(int userID) {
		IDCardInfo ici = null;
		String sql = "select idNum,cardPic,userID,cardPicWithH,status from idcardinfo where userID=?";
		List<Object> params = new ArrayList<Object>();
		params.add(userID);
		ResultSet rs = DbUtil.executeQuery(sql, params);
		try {
			while(rs.next()){
				ici = new IDCardInfo();
				ici.setIdNum(rs.getString(1));
				ici.setCardPic(rs.getString(2));
				ici.setUserID(userID);
				ici.setCardPicWithH(rs.getString(4));
				ici.setStatus(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DbUtil.CloseAll();
		}
		return ici;
	}
	
	
	public int getCount(IDCardInfo idCardInfo,String sql){
		List<Object> params = new ArrayList<Object>();
		params.add(idCardInfo.getCardPic());
		params.add(idCardInfo.getUserID());
		params.add(idCardInfo.getCardPicWithH());
		params.add(idCardInfo.getStatus());
		params.add(idCardInfo.getIdNum());
		int count = DbUtil.executeUpdate(sql, params);
		return count;
	}

	@Override
	public List<IDCardInfo> findAllIdCardInfos() {
		
		return queryIDCardInfoByCondition("",null,null);
	}

	public List<IDCardInfo> queryIDCardInfoByCondition(String keywords,List<Object> params,HashMap<String,String> orderbys){
		String sql ="select * from IDCardInfo where 1=1 "+keywords;
		List<IDCardInfo> ids =  new ArrayList<IDCardInfo>();
		IDCardInfo id = new IDCardInfo();
		if(orderbys!=null&&orderbys.size()>=1){
			for(Entry<String,String> entry : orderbys.entrySet()){
				sql+=" "+entry.getKey()+" "+entry.getValue()+",";
				}
			sql = sql.substring(0, sql.length()-1);
			}
			PreparedStatement pre = DbUtil.getPreparedStatement(sql);
			try {
					if(params!=null&&params.size()>=1){
						for(int i=0;i<params.size();i++){
							if(params.get(i) instanceof Double){
								Double param = (Double)(params.get(i));
									pre.setDouble(i+1,param);
								}else{
									pre.setString(i+1,params.get(i).toString());
								}
						}
							}
					ResultSet res = pre.executeQuery();
					while(res.next()){
						id =  resultToIDCardInfo(res);
						ids.add(id);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					}
		return ids;
	}

	private IDCardInfo resultToIDCardInfo(ResultSet res) {
		IDCardInfo id = new IDCardInfo();
		try {
			
			id.setCardPic(res.getString("cardPic"));
			id.setCardPicWithH(res.getString("cardPicWithH"));
			id.setIdNum(res.getString("idNum"));
			id.setStatus(res.getString("status"));
			id.setUserID(res.getInt("userID"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public void updateIDCardStatus(String id, String status) {
		String sql = "update idcardinfo set status=? where idNum=?";
		PreparedStatement pre = DbUtil.getPreparedStatement(sql);
		try {
			pre.setString(1, status);
			pre.setString(2, id);
			pre.execute();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
	}

	@Override
	public IDCardInfo findByUserId(int userID) {
		String sql = "select * from idcardInfo where userID = ?";
		PreparedStatement pre =DbUtil.getPreparedStatement(sql);
		ResultSet res = null;
		IDCardInfo idCard = null;
		try {
			pre.setInt(1, userID);
			res=pre.executeQuery();
			while(res.next()){
				idCard = resultToIDCardInfo(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idCard;
	}

	@Override
	public int findIdCardInfoCount() {
		String sql = "select count(*) from idcardInfo";
		ResultSet rs = DbUtil.getResultSet(sql);
		int count=-1;
		try {
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
}
