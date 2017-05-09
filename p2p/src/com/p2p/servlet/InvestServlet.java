package com.p2p.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.LoanInfo;
import com.p2p.bean.MorGoods;
import com.p2p.bean.UserInfo;
import com.p2p.service.InvestService;
import com.p2p.service.impl.InvestServiceImpl;
import com.p2p.service.impl.LoanServiceImpl;
import com.p2p.service.impl.MorGoodsServiceImpl;
import com.p2p.util.PageUtil;

public class InvestServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private InvestService investService =  new InvestServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String op = req.getParameter("op");
		System.out.println(op);
		
		LoanServiceImpl loanSer = new LoanServiceImpl();
		MorGoodsServiceImpl morSer = new MorGoodsServiceImpl();
		
		if (op.equals("all")) {
						
			Map<LoanInfo, MorGoods> map = new HashMap<LoanInfo, MorGoods>();
		
			//分页逻辑
			//获取总记录数
			int count=loanSer.queryMsgCount();
			//调用分页工具类<=>逻辑代码
			PageUtil pageUtil=new PageUtil(2, count);
			
			int curPage=Integer.parseInt(req.getParameter("curPage"));
				
			// 处理页码逻辑
			if (curPage <= 1) {

				pageUtil.setCurPage(1);
			} else if (curPage >= pageUtil.getMaxPage()) {

				pageUtil.setCurPage(pageUtil.getMaxPage());
			} else {
				pageUtil.setCurPage(curPage);
			}
			
			List<LoanInfo> loanInfos = loanSer.findAllLoanInfo(curPage, 2);
			
			req.setAttribute("rowsPrePage", pageUtil.getRowsPrePage());
			req.setAttribute("maxRowCount", pageUtil.getMaxRowsCount());
			req.setAttribute("maxPage", pageUtil.getMaxPage());
			req.setAttribute("curPage", pageUtil.getCurPage());
			
			for (LoanInfo loan : loanInfos) {
				MorGoods morGood = morSer.findMorGoods(loan.getLoanID());
				map.put(loan, morGood);
			}
			req.setAttribute("date", new Date(System.currentTimeMillis()));
			req.setAttribute("map", map);
			req.getRequestDispatcher("/invest.jsp").forward(req, resp);
		}else if(op.equals("sel")){
			String where=req.getParameter("where");
			System.out.println(where);
			String myLoans=null;
			if(where.endsWith("deadLinea")){
				myLoans= loanSer.findByDeadLine(0, 1);
			}else if(where.endsWith("deadLineb")){
				myLoans= loanSer.findByDeadLine(2, 3);
			}else if(where.endsWith("deadLinec")){
				myLoans= loanSer.findByDeadLine(4, 6);
			}else if(where.endsWith("deadLined")){
				myLoans= loanSer.findByDeadLine(7, 12);
			}
					System.out.println(myLoans);
					resp.getWriter().write(myLoans);
			}else if(op!=null&&op.equals("invest")){
				
					invest(req,resp);
			}
					
		}

	private void invest(HttpServletRequest req, HttpServletResponse resp) {
		String strMoney =  req.getParameter("money");
		String strLid = req.getParameter("loanId");
		UserInfo userInfo =(UserInfo) req.getSession().getAttribute("user");
		int userId = -1;
		int lid = -1;
		float money = -1.0f; 
		if(strMoney!=null){
			
			money = Float.parseFloat(strMoney);
		}
		if(strLid!=null){
			lid = Integer.parseInt(strLid);
			}
			if(userInfo!=null){
				userId = userInfo.getUserID();
			}
		
			if(lid!=-1&&money!=-1.0f&&userId!=-1){
				investService.invest(lid,userId,money);
			}else{
				return;
			}
		
		
		}
		
	}


