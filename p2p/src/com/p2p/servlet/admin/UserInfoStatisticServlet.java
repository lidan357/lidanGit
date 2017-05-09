package com.p2p.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.p2p.service.UserInfoService;
import com.p2p.service.impl.UserInfoServiceImpl;

public class UserInfoStatisticServlet extends HttpServlet {
	private UserInfoService userService = new UserInfoServiceImpl();

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			String op = request.getParameter("op");
			if(op!=null&&op.equals("sexSta")){
				getSexStatistic(request,response);
				
			}else if(op!=null&&op.equals("ageSta")){
				
				getAgeStatistic(request,response);
				
			}else if(op!=null &&op.equals("incomSta")){
				
				getIncomStatistic(request,response);
				
			}else if(op!=null&&op.equals("eduSta")){
				getEduStatistic(request,response);
			}
	
	}



	
	private void getEduStatistic(HttpServletRequest request,
			HttpServletResponse response) {
		JSONArray eduStatistic =  userService.findEduExpStatistic();
		try {
			//response.setContentType("application/json");
			
			response.getWriter().println(eduStatistic);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}


	private void getIncomStatistic(HttpServletRequest request,
			HttpServletResponse response) {
		JSONArray incomStatistic =  userService.findIncomStatistic();
		try {
			//response.setContentType("application/json");
			
			response.getWriter().println(incomStatistic);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}


	private void getAgeStatistic(HttpServletRequest request,
			HttpServletResponse response) {
		JSONArray ageStatistic =  userService.findAgeStatistic();
		try {
			//response.setContentType("application/json");
			
			response.getWriter().println(ageStatistic);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	private void getSexStatistic(HttpServletRequest request,
			HttpServletResponse response) {
			JSONArray sexStatistic = (JSONArray) userService.findSexStatistic();
			String x = sexStatistic.toString();
			try {
				//response.setContentType("application/json");
				
				response.getWriter().println(sexStatistic.toString());
				response.getWriter().flush();
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
	}


	public void init() throws ServletException {
	}

}
