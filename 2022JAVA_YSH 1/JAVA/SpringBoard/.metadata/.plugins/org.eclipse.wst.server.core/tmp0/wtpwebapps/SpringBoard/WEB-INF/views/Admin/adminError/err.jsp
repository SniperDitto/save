<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
</head>
<body>
<%
	String errCode = (String)request.getAttribute("errorCode");
	String errMsg = (String)request.getAttribute("errMsg");
	
	out.println(errCode);
	out.println(errMsg);
	out.println("유나바보");
%>
</body>
</html>