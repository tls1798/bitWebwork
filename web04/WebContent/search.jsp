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
				<h1>Search Page (mongodb)</h1>
				<form action="list.jsp?search">
					<table align="center" cellspacing="10">
						<tr>
							<td>dname</td>
							<td><input type="text" name="dname"></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input type="submit" value="입 력"> 
								<input	type="reset" value="취 소">
							</td>
						</tr>
					</table>
				</form> <!-- content end -->
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center" bgcolor="gray">Copyright by
				bitacademy co.ltd. All rights reserved.</td>
		</tr>
	</table>

</body>
</html>