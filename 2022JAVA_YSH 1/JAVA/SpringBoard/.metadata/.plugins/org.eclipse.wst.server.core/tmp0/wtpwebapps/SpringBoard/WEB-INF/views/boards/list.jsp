<%@page import="pkg.boards.VO.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<%
	ArrayList<BoardVO> boardList = (ArrayList<BoardVO>)request.getAttribute("boards");
	
	for(BoardVO vo : boardList){
		out.println(vo.getIdx());
		out.println(vo.getTitle());
		out.println(vo.getUserID());
	}

%>
<a href="boardWrite">글쓰기</a>
</body>
</html>