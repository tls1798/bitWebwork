<%@page import="org.bson.conversions.Bson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#dddddd">
<table width="800" align="center" bgcolor="white">
		<tr>
			<td bgcolor="gray" align="center">
  				<a href="list.jsp?p=1">[LIST]</a>
			</td>
		</tr>
		<tr>
			<td>
			<!-- content start -->
	<h1>List</h1>
	<table width="500" align="center" border="1">
		<tr>
			<th>_id</th>
			<th>title</th>
		</tr>
		<%@ page import="com.mongodb.MongoClient, com.mongodb.client.*, org.bson.*, com.mongodb.*"%>
		<%@ page import="com.mongodb.client.model.Filters" %>
		<%
		
		MongoClient client = null;
		MongoDatabase db = null;
		MongoCollection<Document> coll = null;
		int p=1;
		int select=0;
		long c= 100L ;
		try{
			p = Integer.parseInt(request.getParameter("p"));
		} catch(NumberFormatException e){}
		try{
			select=Integer.parseInt(request.getParameter("select"));
		} catch(NumberFormatException e){}
		
		String keyword = request.getParameter("keyword");

		//Bson filter = Filters.regex(select, keyword);
		try {
			client = new MongoClient();
			db = client.getDatabase("testDB");
			coll = db.getCollection("test05");
			coll.countDocuments();
			
			FindIterable<Document> ite = null;
			
			if(select==1){
				BasicDBObject query = new BasicDBObject("title",new BasicDBObject("$regex",keyword));
				c = coll.countDocuments(query);
				ite = coll.find(query).skip(10*(p-1)).limit(10);
			} else if(select==2){
				BasicDBObject query =new BasicDBObject("body",new BasicDBObject("$regex", keyword));
				c = coll.countDocuments(query);
				ite = coll.find(query).skip(10*(p-1)).limit(10);
			} else{
				c = 100L;
				ite = coll.find().skip(10*(p-1)).limit(10);
			}
			System.out.println(c);
			MongoCursor<Document> cursor = ite.iterator();
			
			while (cursor.hasNext()) {
				Document obj = cursor.next();
		%>
		<tr>
			<td><%=obj.getInteger("_id",0)%></td>
			<td><%=obj.getString("title")%></td>
		</tr>
		<%
			}
		} finally {
			client.close();
		}
		%>
	</table>
		<p align = "center">
	<%
		String q = "";
		if(select!=0){
			q = "&select="+select+"&keyword="+keyword;
		} 
		int cnt = (int)c / 10;
		if((int)c%10!=0) cnt++;
		for(int i=1;i<=cnt;i++){
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
	
<!-- content end -->
			</td>
		</tr>
		<tr>
			<td bgcolor = "#cccccc" align="center">
				Copyright by bitacademy co.ltd. All rights reserved.
			</td>
		</tr>
	</table>
</body>
</html>