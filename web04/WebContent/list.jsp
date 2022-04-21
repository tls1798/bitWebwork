<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.mongodb.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="800" align="center" cellspacing="0">
		<tr>
			<td colspan="5"><img src="imgs/logo.jpg"></td>
		</tr>
		<tr>
			<td bgcolor="gray"></td>
			<td bgcolor="gray" width="100" align="center"><a
				href="index.jsp">[HOME]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
			<td bgcolor="gray" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
			<td bgcolor="gray"></td>
		</tr>
		<tr>
			<td colspan="5">
				<!-- content start -->
				<h1>List Page (mongodb)</h1>
				<table border="1" width="80%" align="center">
					<tr>
						<td bgcolor="gray" width="100" value="_id"><a href="list.jsp?sort=_id">deptno</a></td>
						<td bgcolor="gray" width=50% value="dname"><a href="list.jsp?sort=dname">dname</a></td>
						<td bgcolor="gray" value="loc"><a href="list.jsp?sort=loc">loc</a></td>
					</tr>

					<%
					
					String ip = "127.0.0.1";
					int port = 27017;
						
					MongoClient client = new MongoClient(new ServerAddress(ip, port));
					//List<String> names = client.getDatabaseNames();
					//for(int i=0;i<names.size();i++){
					//	System.out.println(names.get(i));
					//}

					DB db = client.getDB("testDB");
					//Set<String> colls = db.getCollectionNames();
					//Iterator ite = colls.iterator();
					//while(ite.hasNext()){
					//	System.out.println(ite.next());
					//}
					String sort = request.getParameter("sort");
					String search = request.getParameter("dname");
					DBCollection coll = db.getCollection("dept02");
					
					DBCursor cursor = coll.find();
					
					if(sort!=null){
						cursor = coll.find().sort(new BasicDBObject(sort,1));
					}

					if(search!=null){
						BasicDBObject query = new BasicDBObject();
						query.put("dname", new BasicDBObject("$regex",search));
						cursor = coll.find(query);
					}
					
					while (cursor.hasNext()) {
						
						DBObject obj = cursor.next();
						out.println("<tr>");
						out.print("<td><a href=\"dept.jsp?deptno="+obj.get("_id")+"\">" + obj.get("_id") + "</a></td>");
						out.print("<td><a href=\"dept.jsp?deptno="+obj.get("_id")+"\">" + obj.get("dname") + "</a></td>");
						out.println("<td><a href=\"dept.jsp?deptno="+obj.get("_id")+"\">" + obj.get("loc") + "</a></td>");
						out.println("</tr>");
					}
					client.close();
					%>

				</table>
				
				<p align="center">
					<a href="search.jsp">[검 색]</a>
					<a href="add.jsp">[입 력]</a>
					<a href="list.jsp">[초기화]</a>					
				</p> <!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="gray">Copyright by
				bitacademy co.ltd. All rights reserved.</td>
		</tr>
	</table>

</body>
</html>