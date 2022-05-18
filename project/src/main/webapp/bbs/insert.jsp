<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");
	String[] params={
			request.getParameter("title"),
			request.getParameter("content")
	};
	String title = params[0];
	String content = params[1];
	String sql = "insert into notice(title, content) values ('" + title + "', '" + content + "')";
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
	response.sendRedirect("../list.jsp");
%>
</body>
</html>