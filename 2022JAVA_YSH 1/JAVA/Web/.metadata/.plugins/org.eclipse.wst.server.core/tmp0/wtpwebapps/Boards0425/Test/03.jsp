<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
	
	<input type="text" name="userID"/><br/>
	<input type="password" name="userPW"/><br/>
	<input type="text" name="date"/><br/>
	<input type="text" name="date"/><br/>
	<input type="text" name="date"/><br/>
	<input type="text" name="date"/><br/>
	<input type="button"/>
	
	<script>
		//$("input[type]").val("asdfasdf");
		//$("input[type='text']").val("text");
		$("input[name*='user']").val("user");//포함
		$("input:eq(1)").val("1");//1번째(0번부터시작)
		$("input:odd").val("odd");//홀수
		
		$(":button").val("확인");
		$("input[type='button']").val("a");
		
		
	</script>
	
</body>
</html>