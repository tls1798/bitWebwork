<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.mongodb.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 	int deptno = Integer.parseInt(request.getParameter("deptno"));
 	String dname = request.getParameter("dname");
 	String loc = request.getParameter("loc");

 	String ip = "127.0.0.1";
 	int port = 27017;

 	MongoClient client = null;
 	try {
 		client = new MongoClient(ip, port);
		BasicDBObject doc = new BasicDBObject();
 		doc.append("dname", dname);
 		doc.append("loc", loc);
 		client.getDB("testDB").
 			getCollection("dept02")
 			.update(new BasicDBObject("_id",deptno)
 					, new BasicDBObject("$set",doc));
 	} finally {
 		client.close();
 	}
 	response.sendRedirect("list.jsp");

%>
</body>
</html>