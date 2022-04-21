<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp 페이지</h1>
	<%=1+2+3+4+5 %>
	<br>
	<%= func() %>
	<br>
	<%! // static 할 필요 없음
	static class Inner1{}
	class Inner2{}
	public Date func(){
		return new Date();
	}
	%>
</body>
</html>