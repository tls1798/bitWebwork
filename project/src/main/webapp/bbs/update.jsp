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
			request.getParameter("idx"),
			request.getParameter("title"),
			request.getParameter("content")
	};
	int idx = Integer.parseInt(params[0].trim());
	String title = params[1];
	String content = params[2];
	
	String sql="update notice set title='"+title+"',content='"+ content+"' where idx="+idx;
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