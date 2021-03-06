<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	var chkCharacter = function(){
		var obj = document.getElementById("userID");
		var inputVal = obj.value;
		//영문, 숫자 제외 입력불가
		var strUse = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		var isOk=true;
		var result = "";
		var chkChar = "";
		for(var i=0;i<inputVal.length;i++){
			chkChar = inputVal.substr(i,1);
			if(strUse.indexOf(chkChar)!=-1){
				result+=chkChar;
			}else{
				isOk = false;
				break;
			}
		}
		if(!isOk){
			result = "";
			alert("아이디는 영문과 숫자만 가능합니다");
			obj.focus();
		}
		obj.value = result;
	}
	
	var chkCharacter2 = function(strUse, obj){
		var inputVal = obj.value;
		var isOk=true;
		var result = "";
		var chkChar = "";
		for(var i=0;i<inputVal.length;i++){
			chkChar = inputVal.substr(i,1);
			if(strUse.indexOf(chkChar)!=-1){
				result+=chkChar;
			}else{
				isOk = false;
				break;
			}
		}
		if(!isOk){
			result = "";
			alert("아이디는 영문과 숫자만 가능합니다");
			obj.focus();
		}
		obj.value = result;
	}	

</script>
</head>
<body>
	<% 
	try{
		String strFail = request.getParameter("join");
		if(strFail!=null && strFail.equals("f")){
			String strScript = "<script>alert('중복된 아이디입니다')</script>";
			out.println(strScript);
		}
	} catch(Exception e){
		e.printStackTrace();
	}
	%>
	<div id="wrap">
	<form method="post" action="./join_ok.jsp">
		<div class="row">
			<span>아이디</span>
			<span>
				<input type="text" name="userID" id="userID" class="" onblur="chkCharacter()" />
			</span>
		</div>
		<div class="row">
			<span>비밀번호</span>
			<span>
				<input type="password" name="userPass" id="userPass" class=""/>
			</span>
		</div>
		<div class="row">
			<span>이름</span>
			<span>
				<input type="text" name="userName" id="userName" class=""/>
			</span>
		</div>
		<div class="row">
			<span>성별</span>
			<span>
				<input type="radio" name="userGen" id="userGenM" class="" value="M"/>남자
				&nbsp;&nbsp;
				<input type="radio" name="userGen" id="userGenF" class="" value="F"/>여자
			</span>
		</div>
		<div class="row">
			<span>취미</span>
			<span>
				<input type="checkbox" name="userHobby" id="userHobby1" class="" value="Reading"/>독서
				&nbsp;&nbsp;
				<input type="checkbox" name="userHobby" id="userHobby2" class="" value="Exercise"/>운동
				&nbsp;&nbsp;
				<input type="checkbox" name="userHobby" id="userHobby3" class="" value="Game"/>게임
				&nbsp;&nbsp;
				<input type="checkbox" name="userHobby" id="userHobby4" class="" value="Programming"/>코딩
				&nbsp;&nbsp;
			</span>
		</div>
		<div class="row">
			<span>
				<input type="submit" name="btn" id="btn" class="" value="확인"/>
			</span>
		</div>
	</form>
	</div>
	
	
	
</body>
</html>