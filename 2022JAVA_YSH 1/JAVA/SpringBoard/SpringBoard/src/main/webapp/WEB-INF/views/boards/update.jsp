<%@page import="pkg.boards.VO.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
<% BoardVO boardVO = (BoardVO)request.getAttribute("boardVO"); %>
<div>
<form name="boardForm" method="post" action="boardUpdate">
	<div>
		글번호 : <input type="text" name="idx" id="idx" value="<%=boardVO.getIdx() %>"/>
	</div>
	<div>
		글제목 : <input type="text" name="title" id="title" value="<%=boardVO.getTitle() %>"/>
	</div>
	<div>
		작성자 : <input type="text" name="userID" id="userID" value="<%=boardVO.getUserID() %>"/>
	</div>
	<input type="submit" value="작성" />
</form>
</div>

</body>
</html>