package com.bit.controller;

import java.io.IOException;
import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Step04 extends Step03{
//	추상 메소드만 상속
	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		PrintWriter pw = res.getWriter();
		pw.println("<h1>ex03 page</h1>");
		pw.close();
	}

}
