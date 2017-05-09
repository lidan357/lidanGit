package com.p2p.dao;

import com.p2p.bean.MorGoods;

public interface MorGoodsDao {
	public boolean addMorGoods(MorGoods morGoods);
	
	/**
	 * @param loanID 贷款编号
	 * @return
	 */
	public MorGoods findMorGoods(int loanID);
}
