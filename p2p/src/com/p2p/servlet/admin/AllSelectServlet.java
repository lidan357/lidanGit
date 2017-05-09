package com.p2p.servlet.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonBeanProcessor;

import com.p2p.bean.LoanInfo;
import com.p2p.bean.UserInfo;
import com.p2p.service.impl.LoanServiceImpl;
import com.p2p.service.impl.UserInfoServiceImpl;

public class AllSelectServlet extends HttpServlet{
	
	private LoanServiceImpl loanServiceImpl = new LoanServiceImpl();
	private UserInfoServiceImpl userInfoServiceImpl = new UserInfoServiceImpl();
	private LoanInfo loanInfo = new LoanInfo();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String op = req.getParameter("op");
		String SuserID = req.getParameter("userID");
		if(!SuserID.isEmpty()){
			int userID = Integer.parseInt(SuserID);
			//。。。贷款列表查询。。。
			if(op.equals("select_btn")){
				getLoanInfoByID(userID,req,resp);
			}
			//。。。用户列表查询。。。
			else if(op.equals("UserInfoselect_btn")){
				getUserInfoByID(userID,req,resp);
			}
			else{
				System.out.println("无法得到数据，请修正代码。。。。。");
			}
		}else{
			System.out.println("请输入ID。。。。。");
		}
		
	}
	//。。。用户列表查询。。。
	private void getUserInfoByID(int userID, HttpServletRequest req,HttpServletResponse resp) {
		System.out.println("方法正在实行。。。。");
		UserInfo userInfo = new UserInfo();
		userInfo = userInfoServiceImpl.findUserInfoById(userID);
		JsonConfig jsonConfig = new JsonConfig();
		JSONArray jsonarray = JSONArray.fromObject(userInfo,jsonConfig);
		try {
			resp.getWriter().println(jsonarray);
			System.out.println(jsonarray);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	//。。。贷款列表查询方法块。。。
	private void getLoanInfoByID(int userID, HttpServletRequest req, HttpServletResponse resp){
		System.out.println("方法正在实行。。。。。");
		List<LoanInfo> list = new ArrayList<LoanInfo>();
		list = loanServiceImpl.findLoanInfoByUserID(userID);
		System.out.println(list.size());
		//转JSON
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonBeanProcessor(java.sql.Date.class, new JsDateJsonBeanProcessor());
		JSONArray jsonarray = JSONArray.fromObject(list,jsonConfig);
		try {
			resp.getWriter().println(jsonarray);
			System.out.println(jsonarray);
			resp.getWriter().flush();
			resp.getWriter().close();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

}
