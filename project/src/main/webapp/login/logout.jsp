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
<jsp:setProperty property="result" name="login" value="false"/>
<jsp:setProperty property="id" name="login" value=""/>
<jsp:setProperty property="password" name="login" value=""/>
<jsp:forward page="form.jsp">
<jsp:param value="true" name="msg"/>
</jsp:forward>
<%
%>
</body>
</html>