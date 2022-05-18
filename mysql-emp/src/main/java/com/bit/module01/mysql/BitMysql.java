package com.bit.module01.mysql;

import java.sql.*;

public class BitMysql {
	// 디자인 패턴 - 싱글톤 패턴
	// 객체 하나를 가지고
	private static Connection conn=null;
	
	private BitMysql() {
		
	}
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		String driver="com.mysql.cj.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/scott";
		String user="user01";
		String password="1234";
//		try {
			if(conn==null || conn.isClosed()) {
				Class.forName(driver);
				conn=DriverManager.getConnection(url,user,password);
			}
//		} catch(ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch(SQLException e) {
//			e.printStackTrace(); 
//		}			
		return conn;
	}
	
//	public static void main(String[] args) {
//		Connection conn = null;
//		try {
//			conn=getConnection();
//			System.out.println(conn!=null);
//			System.out.println(conn.isClosed()!=true);
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(conn!=null) conn.close();				
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//	}
}
