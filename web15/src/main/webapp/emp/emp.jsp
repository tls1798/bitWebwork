<%@page import="com.bit.model.EmpDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<style type="text/css">
	.navbar-header{
		overflow:hidden;
	}
</style>
<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$('button[type="button"]').click(function(){
		history.back();
	})
})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="../">
								<img alt="Brand" src="../imgs/logo.jpg">
							</a>
						</div>
						<p class="navbar-text">
							<a href="../emp/list.html" class="btn">EMP</a>
							<a href="../dept/list.html" class="btn">DEPT</a>						
						</p>
						<p class="navbar-text navbar-right">
						<%if(session.getAttribute("result")!=null){
							out.print(session.getAttribute("id").toString()+"님 로그인 중");
						%>
							<a href="../login/index.html" class="btn">LOGOUT</a>
						<%}else{ %>
							<a href="../login/index.html" class="btn">LOGIN</a>
						<%} %>
						</p>
					</div>
				</nav>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h2>EMP Detail PAGE <small>상세보기</small></h2>
				</div>
				<%
				com.bit.model.EmpDto bean=(com.bit.model.EmpDto)request.getAttribute("emp");
				%>
				
				<form method="post">
					<div class="form-group">
						<label for="empno">empno</label>
						<input type="text" class="form-control" value="<%=bean.getEmpno() %>" name="empno" id="empno" placeholder="empno" readonly/>
					</div>
					<div class="form-group">
						<label for="ename">ename</label>
						<input type="text" class="form-control" value="<%=bean.getEname() %>" name="ename" id="ename" placeholder="ename" readonly/>
					</div>
					<div class="form-group">
						<label for="sal">sal</label>
						<input type="text" class="form-control" value="<%=bean.getSal() %>" name="sal" id="sal" placeholder="sal" readonly/>
					</div>
					<div class="form-group">
						<label for="hiredate">hiredate</label>
						<input type="text" class="form-control" value="<%=bean.getHiredate() %>" name="hiredate" id="hiredate" placeholder="hiredate" readonly/>
					</div>
					<div class="form-group">
						<label for="job">job</label>
						<input type="text" class="form-control" value="<%=bean.getJob() %>" name="job" id="job" placeholder="job" readonly/>
					</div>
					<a href="edit.html?idx=<%=bean.getEmpno() %>" role="button" class="btn btn-primary btn-block">수정</a>
					<a href="delete.html?idx=<%=bean.getEmpno() %>" role="button" class="btn btn-danger btn-block">삭제</a>
					<button type="button" class="btn btn-default btn-block">뒤로</button>
				</form>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<address>
					<strong>&copy;by bitacademy co.ltd. All rights reserved. </strong><br>
					서울특별시 서초구 서초대로74길33 비트빌 3층<br>
					<abbr title="Phone">P:</abbr> (123) 456-7890
				</address>
			</div>
		</div>
	</div>	
</body>
</html>