<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	<%@ page import="com.mongodb.MongoClient, com.mongodb.client.*, org.bson.*, org.bson.conversions.Bson, com.mongodb.client.model.Filters" %>
	<%
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = null;
	String loc = null;
	MongoClient client=null;
	try{
		client = new MongoClient();
		
		MongoDatabase db = client.getDatabase("testDB");
		MongoCollection<Document> coll = db.getCollection("dept02");
		
		Bson filter=Filters.eq("_id", deptno);
		//Document filter=new Document();
		//filter.append("_id",deptno);
		// templateMethod 디자인 패턴
		MongoCursor<Document> cur = coll.find(filter).iterator();
		if(cur.hasNext()){
			Document doc = cur.next();
			deptno = doc.getInteger("_id");
			dname = doc.getString("dname");
			loc = doc.getString("loc");
		}
		
	} finally {
		client.close();
	}
	%>
	<h1>Dept Detail Page</h1>
	<form action="edit.jsp">
	<table align="center" >
		<tr>
			<td width="100" bgcolor="#ccccc" align="center">deptno</td>
			<td><input type="text" name="deptno" value="<%=deptno %>" readonly></td>
		</tr>
		<tr>
			<td width="100" bgcolor="#ccccc" align="center">dname</td>
			<td><input type="text" name="dname" value="<%=dname %>" readonly></td>
		</tr>
		<tr>
			<td width="100" bgcolor="#ccccc" align="center">loc</td>
			<td><input type="text" name="loc" value="<%=loc %>" readonly></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수 정">
	</form>
	<form action="delete.jsp" method="post">
		<input type="hidden" name="deptno" value="<%=deptno %>">
		<input type="submit" value="삭 제">
	</form>
			</td>
		</tr>
	
	</table>
	<%@ include file="../template/footer.jspf" %>
</body>
</html>