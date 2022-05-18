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
	$('.modal').modal('show');
	$('button[type="button"]').click(function(){
		history.back();
	})
	$('.page-header').next().click(function(){
		history.back();
	}).children().click(function(e){e.stopPropagation()});
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
					<h2>EMP Delete PAGE <small>EMP 삭제</small></h2>
				</div>
				<div class="modal fade" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title">Modal title</h4>
							</div>
							<div class="modal-body">
								<p>One fine body&hellip;</p>
							</div>
							<div class="modal-footer">
								<form method="post">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									<input type="hidden" name="idx" value="<%=request.getParameter("idx") %>"/>								
									<button type="submit" class="btn btn-danger">삭제</button>
								</form>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
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