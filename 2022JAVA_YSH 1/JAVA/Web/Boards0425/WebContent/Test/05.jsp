<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.box{
		border : 1px solid black;
		float : left;
	}
</style>
<script>
	var chg=function(){
		$("#user").attr("type","password").attr("style","font-size:18px");
		$("#asdf").hide();
	}
</script>
</head>
<body>
	<div id="msg">
		<!--
		<div>
			<input type="text" id="userID"/>
			<input type="password" id="userPW"/>
			<input type="button" value="확인"/>
		</div>
		-->
	</div>
	<div id="asdf">asdf</div>
	
	
	<script>
		var strHTML="";
		strHTML+='<div>';
		strHTML+=	'<input type="text" id="user"/>';
		strHTML+=	'<input type="button" value="확인" onclick="chg()"/>';
		strHTML+='</div>';
		
		$("#msg").html(strHTML).addClass("box");
		$("#user").css("border","1px solid red");
		$("#user").css("background-color","yellow");
	</script>
	
</body>
</html>