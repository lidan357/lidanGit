package com.p2p.servlet.userzone;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;


import com.p2p.bean.City;
import com.p2p.bean.Promary;
import com.p2p.dao.impl.PCDaoImpl;

public class PCServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		PCDaoImpl pcDao=new PCDaoImpl();
		String op = req.getParameter("op");
		System.out.println(op);
		if (op == null) {
			String pid = req.getParameter("pid");
			ArrayList<City> citys = pcDao.findCity(Integer
					.parseInt(pid));
			ObjectMapper mapper=new ObjectMapper();
			String data=mapper.writeValueAsString(citys);
			out.write(data);
			
		} else if (op.equals("pro")) {
			ArrayList<Promary> allPro = pcDao.findAll();
			req.setAttribute("allPro", allPro);
			req.getRequestDispatcher("/userzone/userData.jsp").forward(req, resp);
		}
	}

}
