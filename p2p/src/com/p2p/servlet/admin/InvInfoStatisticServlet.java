package com.p2p.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.p2p.service.InvestService;
import com.p2p.service.impl.InvestServiceImpl;

public class InvInfoStatisticServlet extends HttpServlet {
	private InvestService invService = new InvestServiceImpl();
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
		String op=request.getParameter("op");
		JSONArray json= null;
		if(op!=null&&op.equals("weekInv")){
			json = invService.findStatistic("weekInv");
			
		}else if(op!=null&&op.equals("inter")){
			json = invService.findStatistic("inter");
			
		}else if(op!=null&&op.equals("moneyInv")){
			json = invService.findStatistic("moneyInv");
			
		}else if(op!=null&&op.equals("userInv")){
			json = invService.findStatistic("userInv");
		}
		try {
			//String str = json. 
			System.out.println(json);
			response.getWriter().println(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
