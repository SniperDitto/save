<%@page import="Pkg.Client.Boards.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="Pkg.Client.Boards.BoardVO"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글내용</title>
</head>
<body>
ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹ<br>
<%=vo.getIdx() %>번 글<br>
대충 글내용


<%
	String url = "./write.jsp";
	url += "?idx="+vo.getIdx();
	url += "&regnum="+vo.getRegnum();
	url += "&lvl="+vo.getLvl();
	url += "&combine="+vo.getCombine();
	url += "&ord="+vo.getOrd();
	url += "&delnum="+vo.getDelnum();
%>

<a href="<%=url %>">답글달기</a>
<a href="./list.jsp">목록</a>
</body>
</html>