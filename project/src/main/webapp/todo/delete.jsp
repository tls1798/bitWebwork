<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="login" class="com.bit.util.UserDto" scope="session"></jsp:useBean>
<% 
	request.setCharacterEncoding("utf-8");
	
	String id = login.getId();
	Long idx = Long.parseLong(request.getParameter("idx"));
	
	String sql="delete from todolist where id='"+id+"' and idx='"+idx+"'";
	String driver="com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/project";
	String user="user01";
	String password="1234";
	
	Class.forName(driver);
	Connection conn = null;
	Statement stmt = null;
	try{
		
		conn=DriverManager.getConnection(url,user,password);
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
		
	}finally{
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
	response.sendRedirect("../"); 
%>
</body>
</html>