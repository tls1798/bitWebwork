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
<style type="text/css">
</style>
<script type="text/javascript">

</script>
</head>
<%@ page import="java.sql.*, com.bit.util.*, java.util.*" %>
<%!
Connection conn;
Statement stmt;

public void insertOne(EmpDto bean) throws SQLException{
	String sql="insert into emp (empno, ename, sal, hiredate) values ("
			+bean.getEmpno()+",'"+bean.getEname()+"',+"+bean.getSal()+",now())";
	try{
		conn=DBServer.getConnection();
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
			
	}finally{
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
	
}
public void insertOne(int empno, String ename, int sal) throws SQLException{
	String sql="insert into emp (empno, ename, sal, hiredate) values ("
			+empno+",'"+ename+"',+"+sal+",now())";
	try{
		conn=DBServer.getConnection();
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
			
	}finally{
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
	
}
%>
<!-- java code -->
<!-- bean 객체 생성 -->
<jsp:useBean id="bean" class="com.bit.util.EmpDto"></jsp:useBean>
<!-- name -> 어떤 객체인지 -->
<jsp:setProperty property="empno" name="bean"/>
<jsp:setProperty property="ename" name="bean"/>
<jsp:setProperty property="sal" name="bean"/>
<%

request.setCharacterEncoding("utf-8"); // servlet filter에서 극복

if(request.getMethod().equals("POST")){
//	int empno=Integer.parseInt(request.getParameter("empno").trim());
//	String ename=request.getParameter("ename").trim();
//	int sal=Integer.parseInt(request.getParameter("sal").trim());

//	EmpDto bean=new EmpDto();
//	bean.setEmpno(empno);
//	bean.setEname(ename);
//	bean.setSal(sal);
	insertOne(bean);
	//insertOne(empno,ename,sal);	
	response.sendRedirect("./");
}

%>
<body>
	<nav>
		<h1><a href="../">비트교육센터</a></h1>
		<jsp:useBean id="login" class="com.bit.util.EmpDto" scope="session"></jsp:useBean>
		<ul>
			<li><a href="../">HOME</a></li>
			<li><a href="../intro.jsp">INTRO</a></li>
			<li><a href="./">LIST</a></li>
		<%if(login.isResult()){ %>
			<li><a href="../login/logout.jsp">LOGOUT</a></li>
			<%}else{ %>
			<li><a href="../login/form.jsp">LOGIN</a></li>
			<%} %>
		</ul>
		<%if(login.isResult()){ %>
		<span><jsp:getProperty property="ename" name="login"/>님 로그인 중...</span>
		<%} %>
	</nav>
	<div class="container">
		<div class="row">
			<div class="grid12">
			<!-- content start -->
			<h2>입력 페이지</h2>
			<form action="" class="form-control" method="post">
				<div class="form-group">
					<label for="empno">empno</label>
					<!--  
					<input type="number" name="empno" id="empno" value='<jsp:getProperty property="empno" name="bean">' placeholder="사번 입력"/>
					-->
					<input type="number" name="empno" id="empno" placeholder="사번 입력"/>
				</div>
				<div class="form-group">
					<label for="ename">ename</label>
					<input type="text" name="ename" id="ename" placeholder="이름 입력"/>
				</div>
				<div class="form-group">
					<label for="sal">sal</label>
					<input type="number" name="sal" id="sal" placeholder="연봉 입력"/>
				</div>
				<div class="form-group">
					<button class="btn btn-primary">입력</button>
					<button class="btn" type="reset">취소</button>
					<button class="btn" type="button">뒤로</button>
				</div>
			</form>
			<!-- content end -->
			</div>
		</div>
		<div class="row">
			<div id="footer" class="grid12">
			&copy; by bitacademy co.ltd. All rigths reserved
			</div>
		</div>
	</div>
</body>
</html>