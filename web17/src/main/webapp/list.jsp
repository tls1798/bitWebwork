<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="template/head.jspf" %>
</head>
<body>
<%@ include file="template/menu.jspf" %>

<div class="jumbotron">
  <h1>EMP</h1>
  <p><a class="btn btn-primary btn-lg" href="add.html" role="button">입력</a></p>
</div>
<div class="page-header">
  <h1>리스트 페이지<small>EMP List</small></h1>
</div>
<div class="list-group">
	<span href="#" class="list-group-item active">
		<h4 class="list-group-item-heading">List group</h4>
		<p class="list-group-item-text">item</p>
	</span>
	<%@page import="java.util.*, com.bit.model.*" %>
	<%
	for(EmpDto bean:(List<EmpDto>)request.getAttribute("list")){
	%>
	<a href="detail.html?idx=<%=bean.getId() %>" class="list-group-item">
		<h4 class="list-group-item-heading"><%=bean.getEname()%> (<%=bean.getEmpno() %>)</h4>
		<p class="list-group-item-text"><%=bean.getItem() %></p>
	</a>
	<%
	}
	%>
</div>
<%@ include file="template/footer.jspf" %>
</body>
</html>