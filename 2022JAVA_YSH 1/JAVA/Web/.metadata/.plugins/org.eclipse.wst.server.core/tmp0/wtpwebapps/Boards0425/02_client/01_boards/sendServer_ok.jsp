<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strText = request.getParameter("text");

	out.println(strText);
%>