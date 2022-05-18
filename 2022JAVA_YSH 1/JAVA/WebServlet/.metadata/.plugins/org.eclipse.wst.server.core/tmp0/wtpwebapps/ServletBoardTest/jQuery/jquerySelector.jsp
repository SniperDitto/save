<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script>
	var showMsg = function(){
		$("#msg").val();
	}
	
	var showMsg2 = function(){
		var objSpan = document.getElementsByTagName("span");
		var strHTML = "";
		
		for(var i=0;i<objSpan.length;i++){
			strHTML += objSpan[i].innerHTML+" ";
		}
		document.getElementById("msg").innerHTML = strHTML;
	}
	
	var showMsg3 = function(){
		$("span").each(function(){
			$("span").html("완");
		});
	}
	
	var showMsg4 = function(){
		$(".box").html("몽짱~");
	}
	
	var showMsg5 = function(){
		$("input[name='userID']").val("낙지~");
	}
</script>
<style>
	.box{
		border : 1px solid black;
		width : 100px;
		height : 100px;
	}
</style>
</head>
<body>
<div id="msg"></div>
<div>
	<span>1. 홍길동</span>
	<span>2. 전우치</span>
	<span>3. 신데렐라</span>
</div>
<div class="box"></div>
<div>
	<input type="text" name="userID"/>
</div>
<div>
	<input type="button" value="확인" onclick="showMsg5()"/>
</div>
</body>
</html>