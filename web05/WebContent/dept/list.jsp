<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#dddddd">
	<%
		String myPath = "..";
	%>
	<%@ include file="../template/header.jspf"%>
	<h1>Dept List</h1>
	<table width="500" align="center" border="1">
		<tr>
			<th>deptno</th>
			<th>dname</th>
			<th>loc</th>
		</tr>
		<%@ page import="com.mongodb.MongoClient, com.mongodb.client.*, org.bson.*"%>
		<%
			// 디폴트일때는 로컬 호스트, 포트번호 27017임
		//Mongo mongo=new MongoClient();
		//DB db = mongo.getDB("testDB");
		//DBCollection coll = db.getCollection("dept02");
		//DBCursor cursor = coll.find();

		// 3점대 버전
		MongoClient client = null;
		MongoDatabase db = null;
		MongoCollection<Document> coll = null;
		int p=1;
		try{
		p = Integer.parseInt(request.getParameter("p"));
		} catch(NumberFormatException e){}
		try {
			client = new MongoClient();
			db = client.getDatabase("testDB");
			coll = db.getCollection("dept02");
			
			FindIterable<Document> ite = coll.find().skip(5*(p-1)).limit(5);
			MongoCursor<Document> cursor = ite.iterator();
			while (cursor.hasNext()) {
				//DBObject obj = cursor.next();
				Document obj = cursor.next();
		%>
		<tr>
			<td><a href="detail.jsp?deptno=<%=obj.getInteger("_id",0)%>"><%=obj.getInteger("_id",0)%></a></td>
			<td><a href="detail.jsp?deptno=<%=obj.getInteger("_id",0)%>"><%=obj.getString("dname")%></a></td>
			<td><a href="detail.jsp?deptno=<%=obj.getInteger("_id",0)%>"><%=obj.getString("loc")%></a></td>
		</tr>
		<%
			}
		} finally {//
		//				mongo.close();
			client.close();
		}
		%>
	</table>
	<p align="center">
		<a href="add.jsp">[입 력]</a>
	</p>
	<%@ include file="../template/footer.jspf"%>
</body>
</html>