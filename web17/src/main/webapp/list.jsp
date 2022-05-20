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
  <p><a class="btn btn-primary btn-lg" href="#" role="button">입력</a></p>
</div>
<div class="page-header">
  <h1>리스트 페이지<small>EMP List</small></h1>
</div>
<div class="list-group">
	<span href="#" class="list-group-item active">
		<h4 class="list-group-item-heading">List group item heading</h4>
		<p class="list-group-item-text">...</p>
	</span>
	<%
	for (int su : new int[] { 1, 2, 3, 4, 5 }) {
	%>
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading">List<%=su%></h4>
		<p class="list-group-item-text">...</p>
	</a>
	<%
	}
	%>
</div>
<%@ include file="template/footer.jspf" %>
</body>
</html>