<%@page import="Pkg.Admin.Board.BoardVO2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Pkg.Admin.Board.BoardList2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="BoardVO2" class="Pkg.Admin.Board.BoardVO2"></jsp:useBean>
<jsp:setProperty property="chks" name="BoardVO2"></jsp:setProperty>
<jsp:setProperty property="idxs" name="BoardVO2"></jsp:setProperty>
<jsp:setProperty property="titles" name="BoardVO2"></jsp:setProperty>
<jsp:setProperty property="userIDs" name="BoardVO2"></jsp:setProperty>
<jsp:setProperty property="regdates" name="BoardVO2"></jsp:setProperty>
<jsp:setProperty property="gbn" name="BoardVO2"></jsp:setProperty>
<jsp:useBean id="boardList" class="Pkg.Admin.Board.BoardList"></jsp:useBean>
<%
/*  삭제 일단 나중에 따로
	BoardList boardList = new BoardList();
	boardList.deleteBoard(BoardVO.getIdxs());
*/
	String[] gbns = request.getParameterValues("gbn");
//1. 삭제

//2. 저장(insert + update)


response.sendRedirect("./board.jsp");
%>