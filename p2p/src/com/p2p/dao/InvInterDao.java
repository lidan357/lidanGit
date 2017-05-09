package com.p2p.dao;

import java.util.List;

import com.p2p.bean.InvInter;

public interface InvInterDao {
	public boolean addInvInter(InvInter invInter);
	
	public boolean updateInvInter(InvInter InvInter);
	
	/**
	 * 查询该贷款编号所对应的所有投资利息
	 * @param loanID
	 * @return
	 */
	public List<InvInter> findInvInterByLoanID(int loanID);
	
	/**
	 * 查询该用户所投资的所有投资利息
	 * @param userID
	 * @return
	 */
	public List<InvInter> findInvInterByUserID(int userID);

	public void deleteByUserIdAndLoanId(int userID, int loanID);

	public List<InvInter> findInvInterByStatus(
			String string);
}
