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
	//페이지 로딩 시 실행(html 로딩 이후)
	$(document).ready(function(){
		$("#btnChk").click(genderFunction);
		$("input[name='hobby']").click(chkOne);
	});
	
	var genderFunction = function(){
		$("input[name='gender']").each(function(){
			if($(this).prop("checked")){
				alert($(this).val());
			}
		});
	}
	
	var chkOne = function(){
		$("input[name='hobby']").each(function(){
			if($(this).prop("checked")){
				alert($(this).val());
			}
			$("input[name='hobby']").prop("checked",false);
			$(this).prop("checked",true);
		});
	}
</script>
</head>
<body>

<div>
	<label><input type="radio" name="gender" id="gMale" value="M"/>남자</label>
	<label><input type="radio" name="gender" id="gFemale" value="F"/>여자</label>
</div>
<div>
	<input type="button" value="확인" id="btnChk"/>
</div>
<div>
	<label><input type="checkbox" name="hobby" id="hobby1" value="coding"/>코딩</label>
	<label><input type="checkbox" name="hobby" id="hobby2" value="sport"/>운동</label>
	<label><input type="checkbox" name="hobby" id="hobby3" value="game"/>게임</label>
	<label><input type="checkbox" name="hobby" id="hobby4" value="reading"/>독서</label>
</div>
<div>
	<input type="button" value="확인" id="btnChk2"/>
</div>
</body>
</html>