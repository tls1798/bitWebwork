<%--  {"root":[
<% 
String sql="select idx, title from notice order by idx desc";
String driver="com.mysql.cj.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/project";
String user="user01";
String password="1234";

Class.forName(driver);
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try{
	conn=DriverManager.getConnection(url,user,password);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	boolean boo=true;
	while(rs.next()){
		if(boo) boo=false;
		else out.print(',');
%>
	{"idx":<%=rs.getInt("idx") %>,"title":"<%=rs.getString("title") %>"}
<% 
	}
}finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
]}

<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
  --%>