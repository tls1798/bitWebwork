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
		<td bgcolor="gray" width="100" align="center"><a href="index.jsp">[HOME]</a></td>
		<td bgcolor="gray" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
		<td bgcolor="gray" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
		<td bgcolor="gray"></td>
	</tr>
	<tr>
		<td colspan="5">
		<!-- content start -->
		<!-- 데이터 베이스 접속 먼저  -->
		<%
		
			int deptno=Integer.parseInt(request.getParameter("deptno"));
			String dname="-";
			String loc = "-";
			
			String sql="select deptno, dname, loc from dept2 where deptno = "+deptno;
			String driver="com.mysql.cj.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/scott";
			String user = "user01";
			String password = "1234";
			
			Properties props=new Properties();
			props.setProperty("user",user);
			props.setProperty("password",password);
			Connection conn=null;
			Statement stmt=null;
			ResultSet rs=null;
			
			try{
				Class.forName(driver);
				conn=DriverManager.getConnection(url,props);
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				if(rs.next()) {
					dname = rs.getString(2);
					loc = rs.getString(3);
				}
			} finally {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();	
			}
			
		%>
		<!-- 출력 작업 뒤에 -->
		<h1>Detail Page (mysql)</h1>
		<table width="80%" align="center">
			<tr>
				<td bgcolor="gray" align="center" width="100">deptno</td>
				<td><%=deptno %></td>
			</tr>
			<tr>
				<td bgcolor="gray" align="center" width="100">dname</td>
				<td><%=dname %></td>
			</tr>
			<tr>
				<td bgcolor="gray" align="center" width="100">loc</td>
				<td><%=loc %></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a href="edit2.jsp?deptno=<%=deptno%>">[수 정]</a>
					<a href="delete2.jsp?deptno=<%=deptno%>">[삭 제]</a>
				</td>
			</tr>
		
		</table>
		<!-- content end -->
		</td>
	</tr>
	<tr>
		<td colspan="5" align="center" bgcolor="gray">
		Copyright by bitacademy co.ltd. All rights reserved.
		</td>
	</tr>
</table>

</body>
</html>