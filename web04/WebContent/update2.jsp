<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 	int deptno = Integer.parseInt(request.getParameter("deptno"));
 	String dname = request.getParameter("dname");
 	String loc = request.getParameter("loc");

 	String ip = "127.0.0.1";
 	int port = 27017;

 	String sql = "update dept2 set dname = '"+dname+"', loc = '"+loc+"' where deptno = "+deptno;
	String driver="com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/scott";
	String user = "user01";
	String password = "1234";
	
	Properties props=new Properties();
	props.setProperty("user",user);
	props.setProperty("password",password);
	Connection conn=null;
	Statement stmt=null;

 	try {
 		Class.forName(driver);
		conn=DriverManager.getConnection(url,props);
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
		
 	} finally {
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();	
	}
 	response.sendRedirect("list2.jsp");

%>
</body>
</html>