<%@page import="pkg.stocks.VO.StockVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
</head>
<body>

<%
	StockVO vo = (StockVO) request.getAttribute("stock");
%>

<div>
	<div>아이디 : <%=vo.getSID() %></div>
	<div>종목명 : <%=vo.getSName() %></div>
	<div>
		<div>회사정보</div>
		<div style="width:600px"><%=vo.getSInfo() %></div>
	</div>
</div>
<a href="stock.do?jspURL=list">주식목록</a>
<a href="stock.do?jspURL=update&sid=<%=vo.getSID() %>">수정</a>
<a href="stock.do?jspURL=delete&sid=<%=vo.getSID() %>" style="color:red">삭제</a>
</body>
</html>