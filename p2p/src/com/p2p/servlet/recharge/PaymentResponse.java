package com.p2p.servlet.recharge;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.p2p.bean.UserInfo;
import com.p2p.service.UserInfoService;
import com.p2p.service.impl.UserInfoServiceImpl;
import com.p2p.util.recharge.PayConfig;
import com.p2p.util.recharge.PaymentUtil;



public class PaymentResponse extends HttpServlet {
	UserInfoService userService = new UserInfoServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		
		String p1_MerId = PayConfig.getValue("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		System.out.println("----"+r6_Order);
		String strId[] =  r6_Order.split("-");
		int uid = Integer.parseInt(strId[0]);
		UserInfo  user = userService.findUserInfoById(uid);
		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("money", r3_Amt);
		String r7_Uid = request.getParameter("r7_Uid");
		String  r8_MP= request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		String hmac = request.getParameter("hmac");
		
		String keyValue = PayConfig.getValue("keyValue");
		
		boolean b = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
		if(!b){
			response.getWriter().write("交易签名已被修改！！！");
			return;
		}
		
		if("1".equals(r1_Code)){  //处理支付成功
			
			if("2".equals(r9_BType)){
				response.getWriter().write("success");
			}
			
			if("1".equals(r9_BType)){
				System.out.println(request.getSession().getAttribute("user"));
				request.setAttribute("money", r3_Amt);
				response.sendRedirect("/p2p/rechargeSucceed.action");
			//	request.getRequestDispatcher("/p2p").forward(request, response);
			}
			
			
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
