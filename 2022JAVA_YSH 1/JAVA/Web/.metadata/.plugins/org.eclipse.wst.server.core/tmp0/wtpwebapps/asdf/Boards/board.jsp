<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="..\css\board.css">
<meta charset="UTF-8">
<title>TestBoard</title>
</head>
<body>
<div id="wrap">
<form action="./boardList_ok.jsp" method="post" name="boardForm" id="boardForm">
	<div id="btns">
		<div class="btn_space"></div>
		<div class="btn_contents">
			<span class="btn">조회</span>
			<span class="btn">추가</span>
			<span class="btn">삭제</span>
			<span class="btn">저장</span>
		</div><!-- btn_contents -->
	</div><!-- btns -->
	<div id="boards">
		<div class="row_head">
			<span class="col_chk">
				<input type="checkbox" name="chkAll" id="chkAll"/>
			</span>
			<span class="col_idx">번호</span>
			<span class="col_title">제목</span>
			<span class="col_userID">작성자</span>
			<span class="col_regdate">작성일</span>
			<span type="hidden"></span>
		</div><!-- row_head -->
		<div class="row_body">
			<span class="col_chk">
				<input type="checkbox" name="chks" id="chk0"/>
			</span>
			<span class="col_idx" name="idx">1</span>
			<span class="col_title" name="titles" value="제목1">
				
			</span>
			<span class="col_userID" name="users" value="작성자1">
				
			</span>
			<span class="col_regdate">123</span>
			<input type="hidden" name="gbns" value=""/><!-- new/up/del -->
		</div><!-- row_body -->
	</div><!-- boards -->
</form><!-- boardForm -->
</div><!-- wrap -->
</body>
</html>