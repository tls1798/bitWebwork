<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="../css/navbar.css">
    <link rel="stylesheet" type="text/css" href="../css/section.css">
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
    <style type="text/css">
    	body{
			height: 100vh;
			background-image: url("../imgs/earth.jpg");
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		section>h2{
			color: white;
			padding: 0px 10px;
		}
    	.group{
    		width: 80%;
    		margin: 0px auto 30px auto ;
    		text-align: center;
    	}
    	label{
    		font-weight: bold;
    		font-size: 20pt;
    		text-align: left;
    		color: white;
    	}
    	/* label:nth-child(2){
    		display: flex;
    		text-align: left;
    	} */
    	input,textarea{
    		width: 80%;
    		height: 20px;
    		margin: 10px;
    	}
    	input:focus,textarea:focus{
    		outline:none;
    	}
    	textarea{
    		height: 100px;
    		resize: none;
    	}
    	input[type=text],input[type=number],textarea{
    		border: none;
    		border-bottom: 1px solid white;
    		text-align: left;
    		font-size: 15pt;
    		background-color:transparent;
    		color: white;
    	}
    	button{
    		border: none;
    		background-color: transparent;
    		font-size: 15pt;
    		color: white;
    	}
    	button:hover{
    		background-color: lightblue;
    		border-radius: 5px;
    	}
    </style>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/navbar.js"></script>
    <script type="text/javascript">
    	if(<%= request.getParameter("msg") %>) alert("이용해주셔서 감사합니다.");
    	$(function(){
    		$('.bi-box-arrow-in-right').click(function(){
      			location.href='../login/form.jsp';
      		})
      		$('.bi-box-arrow-right').click(function(){
      			location.href='../login/logout.jsp';
      		})
    	})
    </script>
<title>Insert title here</title>
</head>
<body>
<%-- <% String path=".."; %>
<%@include file="../template/header.jspf" %> --%>
	<nav class="navbar">
        <div class="logo"><a href="../">ToDoList</a></div>
		<jsp:useBean id="login" class="com.bit.util.UserDto" scope="session"></jsp:useBean>
        <ol class="menus">
            <li><a href="../">HOME</a></li>
            <li><a href="../list.jsp">공지</a></li>
            <%-- <li><a href="<%=path %>/todo.jsp">ToDo</a></li> --%>
        </ol>
        <ul class="icon">
			<%if(login.isResult()){ %>
				<li><jsp:getProperty property="id" name="login"/></li>
				<li><i class="bi bi-box-arrow-right"></i></li>
			<%}else{ %>
				<li><i class="bi bi-box-arrow-in-right"></i></li>
			<%} %>
        </ul>
        <i class="bi bi-list"></i>
    </nav>
    
	<section>
		<h2>입력 페이지</h2>
		<div class="group">
			<form action="insert.jsp" class="form-control" method="post">
				<div class="form-group">
					<label for="title">제 목</label>
					<input type="text" name="title" id="title" placeholder="제목 입력"/>
				</div>
				<div class="form-group">
					<label for="content">내 용</label>
					<textarea name="content" id="content" placeholder="내용 입력" wrap="hard"></textarea>
				</div>
				<div class="form-group">
					<button class="btn">입력</button>
					<button class="btn" type="reset">취소</button>
					<button class="btn" type="button" onclick="history.back()">뒤로</button>
				</div>
			</form>
		</div>
	</section>
<%-- <%@include file="../template/footer.jspf" %> --%>
</body>
</html>