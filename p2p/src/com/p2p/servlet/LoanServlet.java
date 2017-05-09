package com.p2p.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.p2p.bean.IDCardInfo;
import com.p2p.bean.Interest;
import com.p2p.bean.Invest;
import com.p2p.bean.LoanComm;
import com.p2p.bean.LoanInfo;
import com.p2p.bean.MorGoods;
import com.p2p.bean.UserInfo;
import com.p2p.service.IDCardInfoService;
import com.p2p.service.InterestService;
import com.p2p.service.InvestService;
import com.p2p.service.LoanCommService;
import com.p2p.service.LoanService;
import com.p2p.service.MorGoodsService;
import com.p2p.service.UserInfoService;
import com.p2p.service.impl.IDCardInfoServiceImpl;
import com.p2p.service.impl.InterestServiceImpl;
import com.p2p.service.impl.InvestServiceImpl;
import com.p2p.service.impl.LoanCommServiceImpl;
import com.p2p.service.impl.LoanServiceImpl;
import com.p2p.service.impl.MorGoodsServiceImpl;
import com.p2p.service.impl.UserInfoServiceImpl;

public class LoanServlet extends HttpServlet {
	
	private LoanService loanService = new LoanServiceImpl();
	private UserInfoService userService = new UserInfoServiceImpl();
	private InvestService investService = new InvestServiceImpl();
	private InterestService interestService = new InterestServiceImpl();
	private MorGoodsService morGoodsService =new MorGoodsServiceImpl();
	private LoanCommService loanCommService = new LoanCommServiceImpl();
	private IDCardInfoService idCardService = new IDCardInfoServiceImpl();
	
	
	public LoanServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("op");
		if(op!=null&&op.equals("detail")){
			
			getLoanDetail(request,response);
			
			
		}
		
	}
	
//获取贷款的详细信息
	
	private void getLoanDetail(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		String strId = request.getParameter("loanId");
		if(strId!=null){
			int id = Integer.parseInt(strId);
			LoanInfo loan = loanService.findLoanInfoById(id);
			UserInfo lUserinfo = userService.findUserInfoById(loan.getUserID());
			IDCardInfo idCard = idCardService.findByUserId(lUserinfo.getUserID());
			List<Invest> invests = investService.findInvestsByLoanId(id);
			List<UserInfo> iUsers = new ArrayList<UserInfo>();
			for(Invest invest:invests){
					iUsers.add(userService.findUserInfoById(invest.getUserID()));
			}
			List<Interest> interest = interestService.findInterestByLoanId(id);
			List<LoanComm> loanComms = loanCommService.findLoanCommByLoanId(id);
			List<UserInfo> commUsers = new ArrayList<UserInfo>();
			if(loanComms!=null){
				for(LoanComm loanComm:loanComms){
					commUsers.add(userService.findUserInfoById(loanComm.getUserID()));
				}
			}
			MorGoods morGoods = morGoodsService.findMorGoods(id);
			String test = morGoods.getRealPic().substring(morGoods.getRealPic().indexOf("p2p")-1);
			morGoods.setRealPic(test);
			String test2 =idCard.getCardPic().substring(idCard.getCardPic().indexOf("p2p")-1); 
			idCard.setCardPic(test2);
			request.setAttribute("loan", loan);
			request.setAttribute("lUserinfo", lUserinfo);
			request.setAttribute("invests", invests);
			request.setAttribute("iUsers", iUsers);
			request.setAttribute("interest", interest);
			request.setAttribute("morGoods", morGoods);
			request.setAttribute("loanComms", loanComms);
			request.setAttribute("commUsers", commUsers);
			request.setAttribute("idCard",idCard );
			try {
				request.getRequestDispatcher("/detail2.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}else{
			
			
		}
		
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
