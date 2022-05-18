<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../template/head.jsp">
	<jsp:param value=".." name="root"/>
</jsp:include>
<script type="text/javascript">
	if(<%= request.getParameter("msg") %>) alert("이용해주셔서 감사합니다.");
</script>
</head>
<body>
	<nav>
		<h1><a href="../">비트교육센터</a></h1>
		<jsp:useBean id="login" class="com.bit.util.EmpDto" scope="session"></jsp:useBean>
		<ul>
			<li><a href="../">HOME</a></li>
			<li><a href="../list.jsp">공지</a></li>
		</ul>
		<%if(login.isResult()){ %>
		<span><jsp:getProperty property="ename" name="login"/>님 로그인 중...</span>
		<%} %>
	</nav>
<div class="container">
		<div class="row">
			<div class="grid12">
			<!-- content start -->
			<h2>로그인 페이지</h2>
				<form action="login.jsp" method="post" class="form-control">
					<div class="form-group">
						<label for="empno">id</label>
						<input type="text" name="empno" id="empno"/>
					</div>
					<div class="form-group">
						<label for="ename">ename</label>
						<input type="text" name="ename" id="ename"/>
					</div>
					<div class="form-group">
						<button class="btn btn-primary">로그인</button>
						<button class="btn" type="reset">취 소</button>
						<a class="btn" href="#">join</a>						
					</div>
				</form>
			<!-- content end -->
			</div>
		</div>
		<div id="footer" class="row">
			<div class="grid12">
			&copy; by bitacademy co.ltd. All rigths reserved
			</div>
		</div>
	</div>
</body>
</html>