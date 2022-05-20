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
<div class="page-header">
	<h1>입력페이지<samll>EMP Insert</samll></h1>
</div>  

<form class="form-horizontal" method="post">
	<div class="form-group">
		<label for="empno" class="col-sm-2 control-label">empno</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="empno" id="empno" placeholder="empno">
		</div>
	</div>
	<div class="form-group">
		<label for="ename" class="col-sm-2 control-label">ename</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="ename" id="ename" placeholder="ename">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<div class="btn-group" role="group">
				<button type="submit" class="btn btn-primary">입력</button>
				<button type="reset" class="btn btn-default">취소</button>
				<button type="button" onclick="history.back();" class="btn btn-default">뒤로</button>
			</div>
		</div>
	</div>
</form>

<%@ include file="template/footer.jspf" %>
</body>
</html>