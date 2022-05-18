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
    		display: block;
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
    <jsp:useBean id="login" class="com.bit.util.UserDto" scope="session"></jsp:useBean>
    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/navbar.js"></script>
    <script type="text/javascript">
    	
    	$(function(){
    		<% if(login.isResult()){ %>
				$('input,taxtarea').removeAttr('readonly');
				/* $('.btn1').attr('disabled',true); */
				$('.btn1').show();
			<%}else {%>
				$('input,taxtarea').attr('readonly');
				/* $('.btn1').attr('disabled',true); */
				$('.btn1').hide();
			<%}%>
			
			$('.del').on('click',function(){
				
				var idx = $('input[type=number]')[0].valueAsNumber;
				
				location.href='delete.jsp?idx='+idx
			})
    	})
    </script>
<title>Insert title here</title>
</head>
<body>
<nav class="navbar">
        <div class="logo"><a href="../">ToDoList</a></div>
		
        <ol class="menus">
            <li><a href="../">HOME</a></li>
            <li><a href="../list.jsp">공지</a></li>
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
<%-- <% String path=".."; %>
<%@include file="../template/header.jspf" %> --%>
	<section>
		<h2>수정 페이지</h2>
<%
	request.setCharacterEncoding("utf-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String sql="select * from notice where idx="+idx;
	String driver="com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/project";
	String user="user01";
	String password="1234";
	
	Class.forName(driver);
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try{
		conn=DriverManager.getConnection(url,user,password);
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		if(rs.next()){
%>
		<div class="group">
			<form action="update.jsp" class="form-control" method="post">
			 	<div class="form-group">
					<label for="idx">번 호</label>
					<input type="number" name="idx" id="idx" value=<%=idx %> readonly/>
				</div> 
				<div class="form-group">
					<label for="title">제 목</label>
					<input type="text" name="title" id="title" value="<%=rs.getString("title") %>"/>
				</div>
				<div class="form-group">
					<label for="content">내 용</label>
					<textarea name="content" id="content" placeholder="내용 입력" wrap="hard" ><%=rs.getString("content")%></textarea>
				</div>
				<div class="form-group">
					<button class="btn btn1">수정</button>
					<button class="btn btn1 del">삭제</button>
					<button class="btn" type="button" onclick="history.back()">뒤로</button>
				</div>
			</form>
		</div>
<%		}
	}finally{
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}	

%>
	</section>
<%-- <%@include file="../template/footer.jspf" %> --%>
</body>
</html>