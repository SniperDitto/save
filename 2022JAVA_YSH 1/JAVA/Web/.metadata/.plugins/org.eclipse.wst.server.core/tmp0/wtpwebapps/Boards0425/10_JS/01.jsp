<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JS보강1</title>
	<script type="text/javascript">
	
	var valFunc01 = function(){
		var obj1 = document.getElementById("test1");
	}
	
	</script>
</head>
<body>
	<form>
		<input type="text" name="test" id="test1" /><br/><!-- a -->
		<input type="text" name="test" id="test2" /><br/><!-- b -->
		<input type="text" name="test" id="test3" /><br/><!-- c -->
		<input type="text" name="test" id="test4" /><br/><!-- d -->
		<input type="button" value="확인" onclick="valFunc01()"/>
	</form>
</body>
</html>