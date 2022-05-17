<%@page import="pkg.stocks.VO.StockVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>

<%
	StockVO vo = (StockVO) request.getAttribute("stock");
%>

<div>
	<form name="stockForm" id="stockForm" method="post" action="stock.do">
	<input type="hidden" name="jspURL" value="updateOK"/>
	<div>아이디 : <input type="text" name="sid" id="sid" value="<%=vo.getSID() %>"/></div>
	<div>종목명 : <input type="text" name="sname" id="sname" value="<%=vo.getSName() %>"/></div>
	<div>
		<div>회사정보</div>
		<textarea name="sinfo" id="sinfo" style="width:600px"><%=vo.getSInfo() %></textarea>
	</div>
	<input type="submit" id="submitBtn" value="수정하기" onclick="submit()"/>
	</form>
</div>



	<script>
		var submit=function(){
			document.getElementById("submitBtn").submit();
		}
	</script>
</body>
</html>