package com.p2p.dao;

import java.util.List;

import com.p2p.bean.*;

public interface ComChargeDao {
	public boolean addComCharge(ComCharge comCharge);
	
	public ComCharge findComCharge(int loanID);
	
	public List<ComCharge> findAllComCharge();
}
