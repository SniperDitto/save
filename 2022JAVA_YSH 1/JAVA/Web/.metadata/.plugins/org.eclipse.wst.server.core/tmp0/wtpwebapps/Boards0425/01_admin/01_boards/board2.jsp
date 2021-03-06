<%@page import="java.sql.ResultSet"%>
<%@page import="Pkg.DB.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Pkg.Admin.Board.BoardList2"%>
<%@page import="Pkg.Admin.Board.BoardVO2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var addRow = function(){
	var objDiv = document.createElement("DIV");
	
	var objInputs = [];
	for(var i=0;i<6;i++){
		objInputs[i] = document.createElement("INPUT");
	}
	objInputs[0].setAttribute("type","checkbox");
	objInputs[0].setAttribute("name","chks");
	objInputs[0].setAttribute("value","0");
	
	objInputs[1].setAttribute("type","text");
	objInputs[1].setAttribute("name","idxs");
	objInputs[1].setAttribute("value","0");
	
	objInputs[2].setAttribute("type","text");
	objInputs[2].setAttribute("name","titles");
	
	objInputs[3].setAttribute("type","text");
	objInputs[3].setAttribute("name","userIDs");
	
	objInputs[4].setAttribute("type","text");
	objInputs[4].setAttribute("name","regdates");
	objInputs[4].setAttribute("readonly","true");

	objInputs[5].setAttribute("type","hidden");
	objInputs[5].setAttribute("name","gbns");
	objInputs[5].setAttribute("value","i");
	
	
	var objSpans = [];
	for(var i=0;i<6;i++){
		objSpans[i] = document.createElement("SPAN");
		objSpans[i].appendChild(objInputs[i]);
		objDiv.appendChild(objSpans[i]);
	}
	
}

var submitFunc = function(){
	var obj = document.getElementById("adminBordForm");
	obj.submit();
}

</script>
</head>
<body>
<%
	BoardList2 board2 = new BoardList2();
	ArrayList<BoardVO2> aList = board2.getBoardList();

	
%>
<div id="btns">
	<a href="javascript:addRow()">추가</a>
	<a href="javascript:submitFunc()">저장</a>
	<a href="javascript:submitFunc()">삭제</a>
</div>
<form name="adminBordForm" id="adminBordForm" method="post" action="./board_ok.jsp">
<div id="board">
<%for(BoardVO2 vo2 : aList){%>
	<span>
		<input type="checkbox" name="chks" value="<%=vo2.getIdx() %>"/>
	</span>
	<span>
		<input type="text" name="idxs" value="<%=vo2.getIdx() %>" readonly/>
	</span>
	<span>
		<input type="text" name="titles" value="<%=vo2.getTitle() %>" readonly/>
	</span>
	<span>
		<input type="text" name="users" value="<%=vo2.getUserID() %>" readonly/>
	</span>
	<span>
		<input type="text" name="regdates" value="<%=vo2.getRegdate() %>" readonly/>
	</span>
	<span>
		<input type="hidden" name="gbn" value=""/>
	</span>
	<br/>
<%}%>
</div>
</form>
</body>
</html>