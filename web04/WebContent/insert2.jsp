<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="800" align="center" cellspacing="0">
		<tr>
			<td colspan="5"><img src="imgs/logo.jpg"></td>
		</tr>
		<tr>
			<td bgcolor="gray"></td>
			<td bgcolor="gray" width="100" align="center"><a
				href="index.jsp">[HOME]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
			<td bgcolor="gray"></td>
		</tr>
		<tr>
			<td colspan="5">
				<!-- content start --> 
<%
 	try {
 	int deptno = 0;
 	deptno = Integer.parseInt(request.getParameter("deptno"));
 	String dname = request.getParameter("dname");
 	String loc = request.getParameter("loc");

 	String sql = "insert into dept2 values("+deptno+",'"+dname+"','"+loc+"')";
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
 } catch (NumberFormatException e) {
 	//out.println("<h1>오류 발생</h1>");
 	//out.println("<p>계속된 문제가 발생시 전산관리자(tel 000-0000)에게 연락바랍니다.</p>");
 	response.sendRedirect("add2.jsp?err=number01");
 }
 %> 
 				<!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="gray">Copyright by
				bitacademy co.ltd. All rights reserved.</td>
		</tr>
	</table>

</body>
</html>