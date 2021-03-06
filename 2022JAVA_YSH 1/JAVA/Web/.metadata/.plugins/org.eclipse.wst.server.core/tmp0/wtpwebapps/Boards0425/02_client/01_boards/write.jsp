<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>글작성</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script>

	var chkVal = function(){
		var userID = $("#userID").val();
		var title = $("#title").val();
		var content = $("#content").val();
		if(userID.length<1){
			alert("작성자를 입력해주세요");
			$("#userID").focus();
			return false;
		}
		else if(title.length<1){
			alert("글제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
		else if(content.length<1){
			alert("내용이 비어있습니다");
			$("#content").focus();
			return false;
		}
		
		$("#boardForm").submit();
		
	}

</script>
</head>
<body>
	<div>
		글작성페이지
	</div>
	<div>
		<a href="../../index.jsp">home</a>
	</div>
	<form method="post" action="./write_ok.jsp" name="boardForm" id="boardForm" ><!-- onsubmit="return chkVal()" -->
	<table cellpadding="0" cellspacing="0" width="600px" align="center" border="1">
		<tr>
			<td width="120px" height="30px" align="center">작성자</td>
			<td width="480px" height="30px" align="center">
				<input type="text" name="userID" id="userID" class="text1" style="width:150px;height:30px"/>
			</td>
		</tr>
		<tr>
			<td width="120px" height="30px" align="center">글제목</td>
			<td width="480px" height="30px" align="center">
				<input type="text" name="title" id="title" class="text1" style="width:470px;height:30px"/>
			</td>
		</tr>
		<tr>
			<td width="600px" height="120px" align="center" colspan="2">
				<textarea name="content" id="content" class="text1" style="width:590px;height:230px"></textarea>
			</td>
		</tr>
		<tr>
			<td width="600" height="30px" align="center" colspan="2">
				<input type="button" value="작성" onclick="chkVal()"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>