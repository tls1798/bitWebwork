<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="login" class="com.bit.util.UserDto" scope="session"></jsp:useBean>
<%@ page import="java.sql.*, com.bit.util.DBServer" %>
<%!
Connection conn;
Statement stmt;
Statement stmt2;
ResultSet rs;
%>
<%
request.setCharacterEncoding("utf-8");
String id = login.getId();
String todo = new String(request.getParameter("todo").getBytes("8859_1"), "UTF-8");
try{
	String sql="insert into todolist values(current_timestamp()+0,'"+id+"','"+todo+"')";
	conn=DBServer.getConnection();
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