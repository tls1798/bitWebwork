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
				<h1>List Page (mysql)</h1>
				<table border="1" width="80%" align="center">
					<tr>
						<td bgcolor="gray" width="100" value="_id"><a href="list2.jsp?sort=deptno">deptno</a></td>
						<td bgcolor="gray" width=50% value="dname"><a href="list2.jsp?sort=dname">dname</a></td>
						<td bgcolor="gray" value="loc"><a href="list2.jsp?sort=loc">loc</a></td>
					</tr>

					<%
					String sql="select deptno, dname, loc from dept2";
					String driver="com.mysql.cj.jdbc.Driver";
					String url="jdbc:mysql://localhost:3306/scott";
					String user = "user01";
					String password = "1234";
					
					
					String sort = request.getParameter("sort");
					String search = request.getParameter("dname");
					if(sort!=null){
						sql += " order by " + sort;
					}
					if(search!=null){
						sql += " where dname like '%" + search +"%'";
					}
					
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
									while(rs.next()) {
									%>
									<tr>
										<td><a href="dept2.jsp?deptno=<%=rs.getInt(1)%>"><%=rs.getInt(1) %></td>
										<td><a href="dept2.jsp?deptno=<%=rs.getInt(1)%>"><%=rs.getString(2) %></td>
										<td><a href="dept2.jsp?deptno=<%=rs.getInt(1)%>"><%=rs.getString(3) %></td>
									</tr>
									<%
									}
					} finally {
						if(rs!=null) rs.close();
						if(stmt!=null) stmt.close();
						if(conn!=null) conn.close();	
					}
					%>

				</table>
				<p align="center">
					<a href="search2.jsp">[검 색]</a>
					<a href="add2.jsp">[입 력]</a>
					<a href="list2.jsp">[초기화]</a>
				</p> <!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="gray">Copyright by
				bitacademy co.ltd. All rights reserved.</td>
		</tr>
	</table>

</body>
</html>