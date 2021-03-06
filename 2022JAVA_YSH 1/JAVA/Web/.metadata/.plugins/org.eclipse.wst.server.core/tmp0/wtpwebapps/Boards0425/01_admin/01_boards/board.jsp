<%@page import="Pkg.Admin.Board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Pkg.Admin.Board.BoardList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/board.css"/>
<meta charset="UTF-8">
<title>게시판 리스트 - 관리자</title>​
<script>
	var chkAll = function(obj){
		var chks = document.getElementsByName("chk");
		for(var i=0;i<chks.length;i++){
		if(obj.checked){
			chks.checked=true;
		}
		else{
			chks.checked=false;
		}
		}
	}
	
	var goDelete = function(){
		var obj = document.getElementById("adminBordForm");
		obj.submit();
	}
	
	var txtChange = function(gbn,idx){
		//gbn : 바뀐 값이 몇번째줄에있는지 index(글번호와다름)
		var gbns = document.getElementsByName("gbns");
		gbns[gbn].value="U";
		this.style.backgroundColor="red";
	}
	
	var addRow = function(){
		var oldHTML = document.getElementById("boards").innerHTML;
		var strHTML = "";
		strHTML += '<div class="row" name="boardRow">';
		strHTML += '<span class="col0">';
		strHTML += 		'<input type="checkbox" name="idxs"/>';
		strHTML += '</span>';
		strHTML += '<span class="col1"> </span>';
		strHTML += 		'<input type="text" class="col2" name="titles"/>';
		strHTML += 		'<input type="text" class="col3" name="userID"/>';
		strHTML += '<span class="col4"></span>';
		strHTML += '<span style="width:0px" type="hidden" name="gbns" value="I"></span>';
		strHTML += '</div><!-- boardRow -->';
	
		document.getElementById("boards").innerHTML = oldHTML+strHTML;
	}
</script>
</head>
<body>
<%

	BoardList boardList = new BoardList();
	ArrayList<BoardVO> aList = boardList.getBoardList();

%>
<div id="wrap">
<form name="adminBordForm" id="adminBordForm" method="post" action="./boardList_ok.jsp">
		<div id="btns">
			<div class="left"></div>
			<div class="right">
				<span class="btn">조회</span>
				<span class="btn" onclick="addRow()">추가</span>
				<span class="btn" name="update">저장</span>
				<span class="btn" name="delete" onclick="goDelete()">삭제</span>
			</div><!-- right -->
		</div><!-- btns -->
		
			<div id="boards">
				<div class="row" name="boardTRow">
					<span class="col0">
						<input type="checkbox" name="chkT" id="chkT" onclick="chkAll(this)"/>
					</span>
					<span class="col1">번호</span>
					<span class="col2" style="text-align: center">글제목</span>
					<span class="col3">작성자</span>
					<span class="col4">작성일</span>
					<span></span>
				</div><!-- boardTRow -->
				<%	int i=0;
					for(BoardVO vo : aList){
				%>
				<div class="row" name="boardRow">
					<span class="col0">
						<input type="checkbox" name="idxs" value="<%=vo.getIdx() %>"/>
					</span>
					<span class="col1"><%=vo.getIdx() %></span>
					<input type="text" class="col2" name="titles" 
						value="<%=vo.getTitle() %>" onchange="txtchange(<%=i %>,<%=vo.getIdx() %>)"/>
					<input type="text" class="col3" name="userID" 
						value="<%=vo.getUserID() %>" onchange="txtchange(<%=i %>,<%=vo.getIdx() %>)"/>
					<span class="col4"><%=vo.getRegdate() %></span>
					<span style="width:0px" type="hidden" name="gbns"></span>
				</div><!-- boardRow -->
				
				<%		i++;
					}
				%>
				
			</div><!-- boards -->
	</form><!-- adminBordForm -->
	</div><!-- wrap -->
	</body>
</html>