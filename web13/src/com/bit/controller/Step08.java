package com.bit.controller;

import java.io.IOException;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Step08 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		pw.println("<html><head><meta charset=\"utf8\"><body>");
		pw.println("<h1>Post ex08</h1>");
		pw.println("<p>id:"+id+"</p>");
		pw.println("</body></html>");	
		pw.close();
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doGet(req,resp);
////		jsp 구조
////		pageContext
////		request(servlet 존재)
////		response(servlet 존재)
////		session
////		application
////		----------- 그 외 것들 아래처럼
////		req.getSession();
////		req.getServletContext();
////		getservletconfig();
//		
////		requset 받을 때 encoding
//		req.setCharacterEncoding("utf-8");
//		String id = req.getParameter("id");
//		
//		
//		resp.setContentType("text/html; charset=UTF-8");
////		<%@안에 charset %>
////		resp.setCharacterEncoding("utf-8");
//		
//		PrintWriter pw = resp.getWriter();
////		jsp에서 meta charset
//		pw.println("<html><head><meta charset=\"utf8\"><body>");
//		pw.println("<h1>Post ex08</h1>");
//		pw.println("<p>id:"+id+"</p>");
//		pw.println("</body></html>");		
//		pw.close();
	}	
	
}
