<%@page import="Pkg.Board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String strIDX = request.getParameter("idx");
	Board b = new Board();
	b.boardDelete(strIDX);
	
	
	response.sendRedirect("./list.jsp");
%>