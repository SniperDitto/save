<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<script>
	var goJson = function(){
		var member = {
			id : "123",
			name : "asd"
		}
		
		var strJson = JSON.stringify(member);
		document.getElementById("member").value = strJson;
		document.getElementById("myForm").submit();
	}
</script>
</head>
<body>

<form name="myForm" id="myForm" action="test" method="post" >

	<div>
		<input type="text" name="name"/>
		<input type="text" name="id"/>
	</div>
	
	<div>
		<input type="text" name="name"/>
		<input type="text" name="id"/>
	</div>
	<div>
		<input type="text" name="name"/>
		<input type="text" name="id"/>
	</div>

	<div>
		<input type="hidden" name="member" id="member"/>
		<input type="submit" value="전송" onclick="goJson()"/>
	</div>
</form>

</body>
</html>