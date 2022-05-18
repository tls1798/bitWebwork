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
String id = request.getParameter("id").trim();
String password = request.getParameter("password").trim();

boolean c = false;
try{
	String sql="select count(*) from users where id='"+id+"'";
	conn=DBServer.getConnection();
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	if(rs.next()){
		if(rs.getInt(1)>0){
			c = true;
			%>
			<script>
				alert("이미 있는 ID 입니다.");
			</script>			
			<%
		} else{
			String sql2 = "insert into users value ('"+id+"','"+password+"')";
			stmt2=conn.createStatement();
			stmt2.executeUpdate(sql2);
			%>
			<script>
				alert("회원가입이 완료되었습니다. 로그인 해주세요.");
			</script>			
			<%
		}
	}
	
}finally{
	if(stmt2!=null) stmt2.close();
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
if(c){
	%>
	<script>
		location.href = 'signup.jsp';
	</script>
	<%
} else{
	%>
	<script>
		location.href = '../';
	</script>
	<%
}
%>
</body>
</html>