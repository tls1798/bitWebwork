package com.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.EmpDao;

public class EmpAddController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//model
		
		//view
		RequestDispatcher rd = req.getRequestDispatcher("add.jsp");
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int empno=Integer.parseInt(req.getParameter("empno"));
		String ename=req.getParameter("ename");
		int sal = Integer.parseInt(req.getParameter("sal"));
		//model
		EmpDao dao=new EmpDao();
		dao.insertOne(empno,ename,sal);
		//view
		
		resp.sendRedirect("list.html");
	}
}
