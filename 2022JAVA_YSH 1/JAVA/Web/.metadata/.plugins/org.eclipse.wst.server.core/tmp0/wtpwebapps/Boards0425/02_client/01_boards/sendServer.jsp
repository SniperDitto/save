<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버로 값을 보내는 2가지 방법</title>
</head>
<body>

	<form action="./sendServer_ok.jsp" method="get">
		<input type="text" name="text"/>
		<button>get확인</button>
	</form>
	
	
	<form action="./sendServer_ok.jsp" method="post">
		<input type="text" name="text"/>
		<button>post확인</button>
	</form>
	
	<div>
		<a href="./sendServer_ok.jsp">서버로 값 보내기</a>
	</div>
	
</body>
</html>