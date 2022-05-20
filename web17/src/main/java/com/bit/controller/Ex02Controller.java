package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex02Controller extends HttpServlet {

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String param1=req.getParameter("param1");
			String param2=req.getParameter("param2");
			System.out.println("web xml mapping servlet"+param1);
			System.out.println("web xml mapping servlet"+param2);
			
			System.out.println("context----------------------");
			String cparam1 = req.getServletContext().getInitParameter("cname1");
			System.out.println("Ex01 context param: cname1="+cparam1);
			
		}
}
