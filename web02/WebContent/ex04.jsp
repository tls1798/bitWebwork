<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.util.Map.Entry" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>파라미터 값 파싱</h1>
	<!-- ex04.jsp?name=xyz&id=asdf -->
	<p>id: <%= request.getParameter("id") %></p>
	<p>name: <%= request.getParameter("name") %></p>
	<p>pw: <%= request.getParameter("pw") %></p>
	<!-- ex04.jsp?items=itm1&items=item2&items=itm3 -->
	<p>item: <%= Arrays.toString(request.getParameterValues("items")) %></p>
	<%
	String[] arr1 = request.getParameterValues("items");
	arr1 = new String[] {};
	for(int i=0;i<arr1.length;i++) {
	%>
	<p>item<%=i+1 %>:<%=arr1[i] %> </p>
	<%} %>
	<!-- 파라미터를 모를 때 -->
	<!-- ex04.jsp?name=xyz&id=asdf -->
	<%
	// 벡터를 위해 탄생 enumeration
	Enumeration<String> enu = request.getParameterNames();
	while(enu.hasMoreElements()){
		String paramName = enu.nextElement();
		String[] params =request.getParameterValues(paramName);
		for(int i=0;i<params.length;i++){
			System.out.println(paramName+"="+params[i]);
		}
	}
	System.out.println("-------------------------------");
	// ex04.jsp?name=xyz&id=asdf&items=itme1&items=item2&items=itme3
	Map<String, String[]> paramMap = request.getParameterMap();
	Set<Entry<String, String[]>> entrys = paramMap.entrySet();
	Iterator<Entry<String, String[]>> ite = entrys.iterator();
	while(ite.hasNext()){
		Entry<String, String[]> entry = ite.next();
		String key = entry.getKey();
		String[] vals = entry.getValue();
		for(int i =0;i<vals.length;i++){
			System.out.println(key+ ":" +vals[i]);
		}
	}
	
	%>
</body>
</html>