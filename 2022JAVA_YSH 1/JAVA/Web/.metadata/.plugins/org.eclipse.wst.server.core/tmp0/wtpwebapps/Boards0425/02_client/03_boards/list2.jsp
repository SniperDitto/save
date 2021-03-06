<%@page import="Pkg.Client.Boards.BoardService"%>
<%@page import="Pkg.Client.Boards.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bs" class="Pkg.Client.Boards.BoardService"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<script>
	var httpRequestBoard;
	var getHttpRequest = function(){
		if(window.XMLHttpRequest){
			httpRequestBoard = new XMLHttpRequest();
		}else if(window.ActiveXObject){
			//IE6.0이하
			httpRequestBoard = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	var callBoardXML = function(){
		getHttpRequest();
		
		httpRequestBoard.onreadystatechange = loadBoard;
		httpRequestBoard.open("post", "./ajaxPages/getBoardList.jsp",true);
		httpRequestBoard.send();
	}
	
	var loadBoard = function(){
		var strHTML = "";
		var idx = "";
		var title = "";
		var userid = "";
		var regnum = "";
		var lvl = "";
		var combine	= "";
		var lmenuid = "";
		var ord = "";
		var delnum = "";
		
		if(httpRequestBoard.readyState==4 && httpRequestBoard.status==200){
			var boardXML = httpRequestBoard.responseXML;
			var arrBoards = boardXML.getElementsByTagName("Board");
			
			for(var i=0;i<arrBoards.length;i++){
				idx = arrBoards[i].childNodes[0].childNodes[0].nodeValue;
				title = arrBoards[i].childNodes[1].childNodes[0].nodeValue;
				userid = arrBoards[i].childNodes[3].childNodes[0].nodeValue;
				regnum = arrBoards[i].childNodes[4].childNodes[0].nodeValue;
				lvl = arrBoards[i].childNodes[5].childNodes[0].nodeValue;
				combine = arrBoards[i].childNodes[6].childNodes[0].nodeValue;
				lmenuid = arrBoards[i].childNodes[9].childNodes[0].nodeValue;
				ord = arrBoards[i].childNodes[10].childNodes[0].nodeValue;
				delnum = arrBoards[i].childNodes[11].childNodes[0].nodeValue;
				
				strHTML += "<div id=\"board\" name=\"board\">";
				strHTML += "<span id=\"idx\" name=\"idx\">"+idx+"</span>";
				strHTML += "<span id=\"title\" name=\"title\">"+title+"</span>";
				strHTML += "<span id=\"userid\" name=\"userid\">"+userid+"</span>";
				strHTML += "<input type=\"hidden\" id=\"regnum\" name=\"regnum\" value='"+regnum+"'/>";
				strHTML += "<input type=\"hidden\" id=\"lvl\" name=\"regnum\" value='"+lvl+"'/>";
				strHTML += "<input type=\"hidden\" id=\"combine\" name=\"regnum\" value='"+combine+"'/>";
				strHTML += "<input type=\"hidden\" id=\"lmenuid\" name=\"regnum\" value='"+lmenuid+"'/>";
				strHTML += "<input type=\"hidden\" id=\"ord\" name=\"regnum\" value='"+ord+"'/>";
				strHTML += "<input type=\"hidden\" id=\"delnum\" name=\"regnum\" value='"+delnum+"'/>";
				strHTML += "</div>";
			}
			
		}else{
			//alert("연결실패~");
		}
		document.getElementById("boards").innerHTML = strHTML;
	}
	
</script>
</head>
<body onload="callBoardXML()">
	<div id="boards" class="boards">
		
	</div>
	<a href="./write.jsp">글쓰기</a>
</body>
</html>