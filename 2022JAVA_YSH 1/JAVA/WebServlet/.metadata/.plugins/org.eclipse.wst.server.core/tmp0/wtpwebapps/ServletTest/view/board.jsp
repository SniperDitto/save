<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<String> boards = (ArrayList<String>)request.getAttribute("boardList");
%>
<div>
<% for(String s : boards){ %>
<div><%=s %></div>
<%} %>
</div>
</body>
</html>