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
		<input type="button" value="check"/>
	</div>
	<div>
		<label><input type="checkbox"  value="먹기"  name="hobby"/>먹기</label>
		<label><input type="checkbox"  value="자기"  name="hobby"/>자기</label>
		<label><input type="checkbox"  value="놀기"  name="hobby"/>놀기</label>
		<label><input type="checkbox"  value="노래하기"  name="hobby"/>노래하기</label>
	</div>
	
	<script>

			$(this).click(function(){
				if($("input[name='hobby']").prop("checked")){
					$("input[name='hobby']").prop("checked",false);
				}
				else{
					$("input[name='hobby']").prop("checked",true);
				}
			});

	</script>
</body>
</html>