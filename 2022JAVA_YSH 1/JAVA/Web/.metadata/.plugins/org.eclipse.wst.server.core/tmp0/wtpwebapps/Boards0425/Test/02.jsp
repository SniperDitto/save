<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<script>
	function chkFunc(){
		/*
		var objs = document.getElementsByTagName("input");
		for(var i=0;i<objs.length;i++){
			objs[i].checked=true ;
		}
		*/
		$("input").prop('checked',true);
	}
	function chgVal(){
		/*
		var objs = document.getElementsByTagName("span");
		for(var i=0;i<objs.length;i++){
			objs[i].innerHTML = i;
		}
		*/
		$("span").html("a");
	}
</script>
</head>
<body>
	<div>
		<input type="checkbox" name="hobby"/> 독서
		<input type="checkbox" name="hobby"/> 잠
		<input type="checkbox" name="hobby"/> 음악감상
		<input type="checkbox" name="hobby"/> 게임
		<input type="button" value="확인" onclick="chkFunc()" /> 
	</div>
	<div>
		<span>1</span>
		<span>1</span>
		<span>1</span>
		<span>1</span>
		<input type="button" value="확인" onclick="chgVal()" /> 
	</div>
</body>
</html>