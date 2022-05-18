package com.bit.util;

import java.sql.*;


public class DBServer {
//	싱글톤
	private static Connection conn;
	private static String driver="com.mysql.cj.jdbc.Driver";
	private static String url="jdbc:mysql://localhost:3306/project";
	private static String user="user01";
	private static String password="1234";
	
	private DBServer() {}

//	서버 바꿀 때
//	public static void setUrl(String url) {
//		DBServer.url = url;
//	}
	
	public static Connection getConnection() throws SQLException {
		
		if(conn==null || conn.isClosed()) {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			conn=DriverManager.getConnection(url,user,password);
			
		}
		
		return conn;
	}
}