<%@page import="pkg.admin.DTO.MenuDTO"%>
<%@page import="java.util.List"%>
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
	List<MenuDTO> menusList = (List<MenuDTO>)request.getAttribute("menusList");
%>
</body>
</html>


