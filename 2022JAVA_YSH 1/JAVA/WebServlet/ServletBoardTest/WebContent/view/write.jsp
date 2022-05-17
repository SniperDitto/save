<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
</head>
<body>
	<div>
	<form name="stockForm" id="stockForm" method="post" action="stock.do">
		<input type="hidden" name="jspURL" value="writeOK"/>
		<div>아이디 : <input type="text" name="sid" id="sid"/></div>
		<div>종목명 : <input type="text" name="sname" id="sname"/></div>
		<div>
			<div>회사정보</div>
			<textarea name="sinfo" id="sinfo" style="width:600px"></textarea>
		</div>
		<input type="button" id="submitBtn" value="추가" onclick="submit()"/>
	</form>
	</div>
	
	
	
	
	<script>
		var submit=function(){
			document.getElementById("submitBtn").submit();
		}
	</script>
</body>
</html>