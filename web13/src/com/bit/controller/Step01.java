package com.bit.controller;

import java.io.IOException;
import java.io.*;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Step01 implements Servlet{
	ServletConfig config;

	@Override
	public void destroy() {
		System.out.println("서블릿 객체 소멸");
		
	}
	
	@Override
	public void init(ServletConfig arg0) throws ServletException {
		System.out.println("서블릿 객체 생성");
		config=arg0;
	}

	@Override
	public ServletConfig getServletConfig() {
		System.out.println("getServletConfig");
		return null;
	}

	@Override
	public String getServletInfo() {
//		jsp 에서 <%@ 안에 Info? 와 같은 역할
		System.out.println("getServletInfo");
		return "servlet info";
	}


	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
//		기존 자바에서 메인
		System.out.println("service");
		OutputStream os = res.getOutputStream();
		PrintStream out = new PrintStream(os);
		out.println("<h1>hello world</h1>");
		out.println("<p><a href=\"ex02.html\">link</a></p>");
		out.close();
//		File file = new File("C:\\webwork\\web13\\logo.jpg");
//		FileInputStream is = new FileInputStream(file);
//		while(true) {
//			int su = is.read();
//			if(su==-1) break;
//			os.write(su);
//		}
		os.close();
	}

	
	
}
