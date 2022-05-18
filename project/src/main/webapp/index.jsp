<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, com.bit.util.*"%>
<!DOCTYPE html>
<html lang="kr">
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
    	.time{
    		width: 100%;
    		height: 100%;
    		text-align: center;
    		margin: 10px auto;
    	}
    	.time>div{
    		margin: 10px auto;
    		font-weight: bold;
    		font-size: 50pt;
    		color: white;
    	}
    	section>h2{
    		font-weight: bold;
    		text-align: center;
    		color: white;
    		margin: 10px auto;
    		padding: 10px auto;
    		font-size: 25pt;
    	}
    	.idx{
    		margin: 10px auto;
    		text-align: center;
    	}
    	.todo{
    		margin: 10px auto;
    		text-align: center;
    		
    	}
    	input:focus{
    		outline:none;
    	}
    	input[type=text]{
    		border: none;
    		border-bottom: 1px solid white;
    		text-align: center;
    		font-size: 20pt;
    		background-color:transparent;
    		color: white;
    	}
    	input[type=text].edit{
    		font-size: 15pt;
    		text-align:left;
    		border:none;
    		padding-left: 10px;
    	}
    	.name{
    		font-size: 20pt;
    		color: white;
    		text-decoration: none;
    	}
    	.list{
    		margin: 10px auto;
    		padding: 10px auto;
    		background-color: black;
    		width: 70%;
    		color:white;
    		border-radius: 10px;
    		
    	}
    	.list>h2{
    		padding:10px;
    	}
    	.list>ul{
    		list-style: none;
    		padding:10px auto;
    		font-size: 15pt;
    	}
    	.list>ul div{
    		display: flex;
    		margin: 10px auto; 
    		padding: 10px auto; 
    				
    	}
    	.list>ul li a{
    		color: white;
    		text-decoration: none;
    	}
    	.list>ul li:nth-child(3){
    		padding-right: 20px;
    		margin-left:auto;
    	}
    	.blank{
    		padding-bottom: 10px;
    	}
    	.content{
    		margin-bottom: 10px;
    		padding-left: 10px;
    	}
    	
    	.login{
    		text-decoration: none;
    		font-weight: bold;
    		text-align: center;
    		color: white;
    		margin: 10px auto;
    		padding: 10px auto;
    		font-size: 20pt;
    	}
    	.login:hover{
    		 background-color: lightblue;
   			 border-radius: 5px;
    	}
    </style>
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="js/navbar.js"></script>
<script type="text/javascript">
    
    $(function(){
    	// 시간 표시
    	var callback1=function(){
    		var today = new Date();
    		var h = ('0'+today.getHours()).slice(-2);
    		var m = ('0'+today.getMinutes()).slice(-2);
    		var s = ('0'+today.getSeconds()).slice(-2);
    		var time = h+':'+m+':'+s;
			$('.time>div').html(time);
    		setTimeout(callback1, 1000);
    	}
    	callback1();
    	

    	// edit
    	var edit = $('.content').click(function(){
    		if(($(this).parent().prev().children().is(':checked'))==false){
	    		var text = $(this).html();
	    		$(this).hide();
	    		$(this).next().attr('value',text).show().focus();
	    		$(this).next()[0].setSelectionRange(text.length,text.length);
    		}
    		return false;
    	})
    	
    	
    	// 체크 확인
    	$(document).on('click','.check',function(){
    		if(($(this).is(':checked'))==true){
	    		$(this).parent().next().children().css('text-decoration', 'line-through').css('color','gray');    			
    		}
    		else{
	    		$(this).parent().next().children().css('text-decoration', 'none').css('color','white');
    		}
    	});
    	// insert
    	$(document).on('keyup','.todo>input',function(e){
    		var text = e.target.value;
    		if(e.keyCode==13 && text!==""){
    			location.href='todo/insert.jsp?todo='+text;
    		}
    	})
    	
    	// edit
    	$(document).on('click','.content',function(e){
    		if(($(this).parent().prev().children().is(':checked'))==false){
	    		var text = $(this).html();
	    		$(this).hide();
	    		$(this).next().attr('value',text).show().focus();
	    		$(this).next()[0].setSelectionRange(text.length,text.length);    			
    		}
    		return false;
    	})
    	
    	$(document).on('blur','.edit',function(){
    		$('.edit').hide();
  			$('.content').show();
    	}).on('keyup','.edit',function(e){
    		var idx = $(this).parent().children()[0].value;
    		var pre = $(this).prev().html();
    		var text = e.target.value;
    		
    		if(e.keyCode==13 && text!=""){
    			$('.edit').hide();
      			$('.content').show();
      			location.href='todo/update.jsp?todo='+text+'&idx='+idx;
    		}
    		if(e.keyCode==13 && text==""){
    			$(this).prev().html(pre);
    			$('.edit').hide();
      			$('.content').show();
    		}
    	})
    	// del
    	$(document).on('click','.bi-trash',function(){
    		var idx = $(this).parent().prev().children()[0].value;
    		location.href='todo/delete.jsp?&idx='+idx;     		
    	})
    	// 
  		
  		$('.edit').hide();
  		$('.value').hide();
  		$('.bi-box-arrow-in-right').click(function(){
  			location.href='login/form.jsp';
  		})
  		$('.bi-box-arrow-right').click(function(){
  			location.href='login/logout.jsp';
  		})
  		
    });
    </script>
    <title>Document</title>
</head>
<body>
	<nav class="navbar">
        <div class="logo"><a href="./">ToDoList</a></div>
		<jsp:useBean id="login" class="com.bit.util.UserDto" scope="session"></jsp:useBean>
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
	<%-- <% String path="."; %>
	<%@include file="template/header.jspf" %> --%>
    
    <section>
    
		<div class="time">
			<div></div>
		</div>
		
		<%if(login.isResult()){ %>
			<h2><jsp:getProperty property="id" name="login"/>님 안녕하세요</h2>
			<div class="todo">
				<input type="text" placeholder="Wirte Your List"/>
			</div>
    		<div class="list">
	    		<h2>ToDoList</h2>
	    		<%
	    			String sql= "select idx, todo from todolist where id='"+login.getId()+"' order by idx desc";
	    			Connection conn = null;
					Statement stmt = null;
					ResultSet rs = null;
					try{
						conn=DBServer.getConnection();
						stmt=conn.createStatement();
						rs=stmt.executeQuery(sql);
						while(rs.next()){
	    		%>
	    			<ul>
	    				<div>
	    					<li><input type="checkbox" class="check"/></li>
	    					<li><input type="text" class="value" value="<%=rs.getLong("idx") %>"><a href="#" class="content"><%=rs.getString("todo") %></a><input type="text" class="edit" /></li>
	    					<li><i class="bi bi-trash"></i></li>
	    				</div>
	    			</ul>
	    		<%}
					}finally{
						if(rs!=null) rs.close();
						if(stmt!=null) stmt.close();
						if(conn!=null) conn.close();
					}
	    		%>
	    		
	    		<div class="blank"></div>
    		</div>
		<%}else{ %>
		<div class="idx">
			<a href="login/form.jsp" class="login">로그인후 사용 해주세요</a>					
		</div>
		<%} %>
		
		<br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/>
    </section>
    
    
    <%-- <%@include file="template/footer.jspf" %> --%>
    
</body>
</html>