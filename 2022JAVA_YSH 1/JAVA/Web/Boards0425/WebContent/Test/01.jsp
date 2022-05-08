<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../jquery/jquery-3.6.0.min.js"></script>

<script>
	function test(){
		var obj = $("#msg");
		$("#link").html("네이버");//id로 찾기
		$(".box").css("color","red");
		
	}
</script>
</head>
<body>
	<a href="https://www.naver.com/" id="link">naver</a>
	<div id="msg"></div>
	<div class="box">
		<input type="button" value="확인" onclick="test()"/>
	</div>
	
	<script>
		
		
	</script>
</body>
</html>