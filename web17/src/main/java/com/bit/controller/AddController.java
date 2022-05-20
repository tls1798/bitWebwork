package com.bit.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.bit.model.EmpDao;

@WebServlet("/emp/add.html")
public class AddController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/add.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Map<String,String[]> items=req.getParameterMap();		
		EmpDao dao=new EmpDao();
		dao.insertOne(items);		
		resp.sendRedirect("list.html");
	}
}
