<%@page import="Pkg.Admin.Board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Pkg.Admin.Board.BoardList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="BoardVO" class="Pkg.Admin.Board.BoardVO"></jsp:useBean>
<jsp:setProperty property="idxs" name="BoardVO"></jsp:setProperty>
<jsp:setProperty property="titles" name="BoardVO"></jsp:setProperty>
<jsp:setProperty property="gbns" name="BoardVO"></jsp:setProperty>
<%
/*  삭제 일단 나중에 따로
	BoardList boardList = new BoardList();
	boardList.deleteBoard(BoardVO.getIdxs());
*/

//1. 삭제

//2. 저장(insert + update)


response.sendRedirect("./board.jsp");
%>