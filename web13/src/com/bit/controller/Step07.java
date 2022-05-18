package com.bit.controller;

import java.io.IOException;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Step07 extends Step06{
//  get 방식
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		PrintWriter pw = res.getWriter();
//		pw.println("<h1>step07 Get</h1>");
//		pw.close();
//	}
	
//	post 방식
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		pw.println("<h1>step07 Post</h1>");
		pw.close();
	}
	
}
