<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "Pkg.DB.Test" %>>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href = "https://www.naver.com/">naver</a>
	
	<%
		Test t = new Test("asdf");
		String s = t.getHello();
		System.out.println(s);//콘솔에 출력
		out.println(s);//웹 페이지에 출력
	%>
	
</body>
</html>