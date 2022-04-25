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
		width:50px;
		height:40px;
		background-color:#bbb;
		border:1px solid black;
		padding:15px 0px 15px 0px;
		text-align:center;
		font-size:20px
		display:block;
		float:left;
	}
</style>

</head>
<body >
	<div>
<%	for(int i=0;i<10;i++){%>
		<input type='radio' id='rd<%=i%>' name='num' value='<%=i%>' /><%=i%>
<%	}%>
	</div>
	<div style="clear:both"></div>
	<div>
<%	for(int i=0;i<10;i++){%>
		<span class="box" name="box<%=i%>" ><%=i%></span>
<%	}%>
	</div>
	
<script>
	$(document).ready(function(){
		$("input[name='num']").click(function(){
			$("span[name*='box']").css("background-color","#bbb");
			$("span[name='box"+$(this).val()+"']").css("background-color","#333");
		});
		
		$("span[name*='box']").click(function(){
			$("span[name*='box']").css("background-color","#bbb");
			$(this).css("background-color","#333");
			$("#rd"+$(this).html()).prop('checked',true);
		});
	});
	var radFunc=function(){
		
	}
	
	var boxFunc=function(){
		
	}
</script>
	
</body>
</html>