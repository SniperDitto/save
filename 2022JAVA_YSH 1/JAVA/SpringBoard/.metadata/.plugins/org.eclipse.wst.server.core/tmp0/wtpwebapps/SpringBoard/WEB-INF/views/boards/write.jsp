<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write Page</title>
</head>
<body>
<div>
<form name="boardForm" method="post" action="boardInsert">
	<div>
		글번호 : <input type="text" name="idx" id="idx"/>
	</div>
	<div>
		글제목 : <input type="text" name="title" id="title"/>
	</div>
	<div>
		작성자 : <input type="text" name="userID" id="userID"/>
	</div>
	<input type="submit" value="작성" />
</form>
</div>


</body>
</html>