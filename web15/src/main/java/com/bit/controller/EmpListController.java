package com.bit.controller;

import java.util.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.*;

public class EmpListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//model
		EmpDao dao=new EmpDao();
		List<EmpDto> list = dao.getList();
		//view
		RequestDispatcher rd = req.getRequestDispatcher("list.jsp");
		// request scope 속성 값으로 전달
		req.setAttribute("list", list);
		rd.forward(req,resp);
	}
}
