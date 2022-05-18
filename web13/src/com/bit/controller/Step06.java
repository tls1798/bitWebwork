package com.bit.controller;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Step06 extends GenericServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		if("GET".equals(request.getMethod())) {
			doGet(request, response);
		} else if("POST".equals(request.getMethod())) {
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		에러 접속 막기
		res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	}
	
//	abstract 안하는 이유 -> get, post 둘 중 사용하고 싶은거 사용
	
}
