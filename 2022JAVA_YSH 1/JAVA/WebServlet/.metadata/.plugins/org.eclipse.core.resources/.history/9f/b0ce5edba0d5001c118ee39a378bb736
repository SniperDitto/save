<%@page import="pkg.stocks.VO.StockVO"%>
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
	ArrayList<StockVO> stockList = (ArrayList<StockVO>)request.getAttribute("stockList");
%>
<div>
<% for(StockVO vo : stockList){ %>
	<div>
		<a href="stock.do?jspURL=content&sid=<%=vo.getSID() %>"><%=vo.getSName() %></a>
	</div>
<% } %>
</div>
<a href="stock.do?jspURL=write">주식추가</a>
</body>
</html>