package com.p2p.dao;

import java.sql.Date;
import java.util.List;

import com.p2p.bean.Award;

/**这是一个抽奖dao层接口
 * @author lidan357
 *
 */

public interface AwardDao {
	
	/**添加一条抽奖记录
	 * @param award
	 * @return 是否添加成功
	 */
	public boolean add(Award award);
	
	/**修改一条抽奖记录
	 * @param award
	 * @return
	 */
	public boolean update(Award award);
	
	/**根据用户ID和当天日期查询一条抽奖记录
	 * @param userID
	 * @param date
	 * @return
	 */
	public Award findAward(int userID,Date date);
	
	/**根据奖励ID查询一条抽奖记录
	 * @param awdID
	 * @return
	 */
	public Award findAwardByAwdID(int awdID);
	
	/**根据用户ID查询该用户所有的抽奖记录
	 * @param awdID
	 * @return
	 */
	public List<Award> findAllAwardByAwdID(int userID);
	
	/**查询用户获得的所有奖励金额
	 * @return count(awdMoney)
	 */
	public int countMoney(int userID); 

}
