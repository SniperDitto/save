<%@page import="pkg.boards.VO.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
</head>
<body>
<%
	List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");

	for(BoardVO vo : list){
		out.println(vo.getTitle()+"<br/>");
	}
%>
</body>
</html>