<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var f1 = function(){
		var selIdx = $("#inval").val();
		$("input[type=text]:eq("+(selIdx-1)+")").val("유나바보");
		
	}
</script>
</head>
<body>
	
	
	
	<%for(int i=0;i<10;i++){%>
		<div>
			<input type="text"/>
		</div>
	<%}%>
	<br/>
	<div>
		<span>원하는 위치를 입력하세요(1~10)</span>
		<input type="text" id="inval"/>
		<input type="button" value="확인" onclick="f1()"/>
	</div>
	
</body>
</html>