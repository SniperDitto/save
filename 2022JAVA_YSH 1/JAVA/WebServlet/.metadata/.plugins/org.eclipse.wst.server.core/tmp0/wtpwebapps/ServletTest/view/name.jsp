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
ArrayList<String> nameList = (ArrayList<String>)request.getAttribute("nameList");
ArrayList<String> sportsList = (ArrayList<String>)request.getAttribute("sportsList");
%>

<div>
	<% for(String s : nameList){ %>
		<div> <%=s %> </div>
	<% } %>
</div>
<span>--------------------</span>
<div>
	<% for(String s : sportsList){ %>
		<div> <%=s %> </div>
	<% } %>
</div>
<span>--------------------</span>
<div>메타몽~~~ :)</div>
</body>
</html>