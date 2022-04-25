<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div>
		<!-- 값 하나만 선택되도록 -->
		<label><input type="checkbox"  value="먹기" onclick="jsFunc(this)"/>먹기</label>
		<label><input type="checkbox"  value="자기" onclick="jsFunc(this)"/>자기</label>
		<label><input type="checkbox"  value="놀기" onclick="jsFunc(this)"/>놀기</label>
		<label><input type="checkbox"  value="노래하기" onclick="jsFunc(this)"/>노래하기</label>
	</div>
	<div id="msg">
		<!-- 선택된 값 표시 -->
	</div>
	
	
	<script type="text/javascript">
	//javascript 
	var jsFunc=function(obj){
		var chks = document.getElementsByTagName("input");
		for(var i=0;i<chks.length;i++){
			chks[i].checked=false;
		}
		obj.checked=true;
		document.getElementById("msg").innerHTML = obj.value;
	}

	//jquery
	var jqFunc=function(){
		$("input[type='checkbox']").click(function(){
			if($(this).prop("checked")){
				$("input[type='checkbox']").prop("checked",false);
				$(this).prop("checked",true);
				$("#msg").html($(this).val());	
			}
		});
	}
	
	
</script>

</body>
</html>