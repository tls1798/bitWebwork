package com.bit.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.*;

@WebServlet("/emp/detail.html")
public class DetailController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx=req.getParameter("idx");
		EmpDao dao=new EmpDao();
		req.setAttribute("bean", dao.selectOne(idx));
		req.getRequestDispatcher("../detail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Map<String, String[]> params=req.getParameterMap();
		EmpDao dao=new EmpDao();
		dao.updateOne(params);
		doGet(req, resp);
	}
	
}
