<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="css/navbar.css">
    <link rel="stylesheet" type="text/css" href="css/section.css">
    <style rel="stylesheet" type="text/css">
    	body{
			height: 100vh;
			background-image: url("imgs/earth.jpg");
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		section>h2{
			color: white;
			padding: 0px 10px;
		}
    	section>div{
    		text-align: right;
    	}
    	section>div>a{
    		text-decoration: none;
    		color: white;
    		padding: 8px 12px;
    		margin-bottom: 10px;
    	}
    	section>div>a:hover{
    		background-color: lightblue;
    		border-radius: 5px;
    	}
    	
    	table,.table tr>th,.table tr>td{
			border: 1px solid white;
			border-collapse: collapse;
		}
		.table{
			width: 80%;
			margin: 50px auto;
			background-color: black;
			border-top: 3px solid white;
		}
		.table tr>th{
			background-color: lightblue;
		}
		.table tr>th,.table tr>td{
			height: 30px;
			padding:10px;
		}
		.table tr>th:first-child{
			width: 30%;
		}
		.table tr>th:last-child{
			width: 70%;
		}
		.table tr>td>a{
			text-decoration: none;
			color: white;
			display: block;
			height: 25px;
		}
		.table tr>td:first-child>a{
			text-align:center;
		}
		.table tr>td:last-child>a{
			text-align:left;
			padding-left: 10px;
		}
		.table th:first-child, .table td:first-child{
			border-left:0;
		}
		.table th:last-child, .table td:last-child{
			border-rigth:0;
		}
		section>p>a{
			text-decoration: none;
    		color: white;
    		padding: 4px 3px;
    		
		}
		section>p>a:hover{
			background-color: lightblue;
    		border-radius: 5px;
		}
		select{
			background-color: black;
			border-radius: 5px;
			outline: 0px none;
			color: white;
			padding: 5px 5px;
			
		}
		input:focus{
    		outline:none;
    	}
		input[type=text]{
			border: none;
    		border-bottom: 1px solid white;
    		font-size: 15pt;
    		background-color:transparent;
    		color: white;
		}
		input[type=submit]{
			border: none;
			padding: 4px 6px;
			background-color:transparent;
			color: white;
		}
		input[type=submit]:hover{
			background-color: lightblue;
    		border-radius: 5px;
		}
		#content{
			width: 200px;
			height: 100px;
		}
		
    </style>
    <jsp:useBean id="login" class="com.bit.util.UserDto" scope="session"></jsp:useBean>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="js/navbar.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$('.bi-box-arrow-in-right').click(function(){
      			location.href='login/form.jsp';
      		})
      		$('.bi-box-arrow-right').click(function(){
      			location.href='login/logout.jsp';
      		})
      		
    	})
    </script>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar">
        <div class="logo"><a href="./">ToDoList</a></div>
        
        <ol class="menus">
            <li><a href="./">HOME</a></li>
            <li><a href="list.jsp">공지</a></li>
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
	<%-- <% String path=".";	%>
	<%@include file="template/header.jspf" %> --%>
	<section>
		<h2>공지사항</h2>
		<div>
		<%if(login.isResult()){ %>
				<a href="bbs/add.jsp">글쓰기</a>
		<%}else{ %>
				<a></a>
		<%} %>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>idx</th>
					<th>title</th>
				</tr>
			</thead>
			<tbody>
			<% 
			int p = 1;
			int select=0;
			int cnt = 0;
			
			try{
				p = Integer.parseInt(request.getParameter("p"));
			} catch(NumberFormatException e){}
			try{
				select=Integer.parseInt(request.getParameter("select"));
			} catch(NumberFormatException e){}
			
			String keyword = request.getParameter("keyword");
			if(keyword!=null){
				keyword = new String(request.getParameter("keyword").getBytes("8859_1"), "UTF-8");				
			}
			String where = "";
			if(select == 1){
				where = "where title like '%"+keyword+"%'";	
			} else if(select == 2){
				where = "where content like '%"+keyword+"%'";
			}

			
			String sql="select idx, title from notice "+where+" order by idx desc limit "+(p-1)*10+", 10";
			String sql2="select count(*) from notice";
			String driver="com.mysql.cj.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/project";
			String user="user01";
			String password="1234";
			
			Class.forName(driver);
			Connection conn = null;
			Statement stmt = null;
			Statement stmt2 = null;
			ResultSet rs = null;
			ResultSet rs2 = null;
			
			try{
				conn=DriverManager.getConnection(url,user,password);
				stmt=conn.createStatement();
				stmt2=conn.createStatement();
				
				rs2=stmt2.executeQuery(sql2);
				if(rs2.next()) cnt = rs2.getInt(1);
				
				rs=stmt.executeQuery(sql);
				
				while(rs.next()){
			%>
			<tr>
				<td><a href="bbs/detail.jsp?idx=<%=rs.getInt("idx") %>"><%=rs.getInt("idx") %></a></td>
				<td><a href="bbs/detail.jsp?idx=<%=rs.getInt("idx") %>"><%=rs.getString("title").length()>10?rs.getString("title").substring(0,10)+"...":rs.getString("title") %></a></td>
			</tr>
			<% 
				}
			}finally{
				if(rs2!=null) rs2.close();
				if(rs!=null) rs.close();
				
				if(stmt2!=null) stmt2.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			}
			
			%>

			</tbody>
		</table>
		
		<p align = "center">
		<%
		String q = "";
		if(select!=0){
			q = "&select="+select+"&keyword="+keyword;
		}
		int c = cnt / 10;
		
		if(cnt%10!=0) c++;
		
		for(int i=1;i<=c;i++){
		%>
			<a href="list.jsp?p=<%=i + q%>">[<%=i %>]</a>
		<%
		}
		%>
		</p>
		
		<form action="list.jsp?p=1">
			<p align = "center">
				<select name = "select" >
					<option value ="0">선택</option>
					<option value ="1">제목</option>
					<option value ="2">내용</option>
				</select>
				<input type="text" name="keyword">
				<input type="submit" value="검색">
			</p>
		</form>
		
		
	</section>
	<%-- <%@include file="template/footer.jspf" %> --%>
</body>
</html>