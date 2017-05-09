package com.p2p.service.impl;

import com.p2p.bean.MorGoods;
import com.p2p.dao.impl.MorGoodsDaoImpl;
import com.p2p.service.MorGoodsService;

public class MorGoodsServiceImpl implements MorGoodsService{
	MorGoodsDaoImpl impl=new MorGoodsDaoImpl();
	@Override
	public MorGoods findMorGoods(int loanID) {
		// TODO Auto-generated method stub
		return impl.findMorGoods(loanID);
	}

}
