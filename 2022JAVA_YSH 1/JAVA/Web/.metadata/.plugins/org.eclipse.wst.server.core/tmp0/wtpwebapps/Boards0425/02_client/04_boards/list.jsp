
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<script type="text/javascript" src="./js/board.js"></script>
<link rel="stylesheet" href="./css/board.css">
</head>
<body onload="init()">
<%
	request.setCharacterEncoding("UTF-8");
	String loginID = (String)session.getAttribute("userID");
	String hMenuID = request.getParameter("hMenuID");
	String lMenuID = request.getParameter("lMenuID");
	out.print("대분류 : "+hMenuID);
	out.print(" / 소분류 : "+lMenuID);
	out.print(" / 로그인한 사람 : "+loginID);
	if(lMenuID==null){
		//lMenu 선택 안한 상태
		hMenuID = "MENU01";
		lMenuID = "";
	}else{
		//lMenu 선택해서 새로고침됨
	}
	
	
%>
<script type="text/javascript">

var init = function(){
	getHMenuList();
	getLMenuList("<%=hMenuID %>");
	getBoardList("<%=lMenuID %>");
}
var goWrite = function(){
	location.href="./write.jsp?hMenuID=<%=hMenuID %>&lMenuID=<%=lMenuID%>";
}
var go_content = function(idx,regnum, lvl, combine, ord,delnum){
	document.getElementById("idx").value = idx;
	document.getElementById("regnum").value = regnum;
	document.getElementById("lvl").value = lvl;
	document.getElementById("combine").value = combine;
	document.getElementById("ord").value = ord;
	document.getElementById("delnum").value = delnum;
	
	document.getElementById("hiddenForm").submit();
}
</script>
<form name="hiddenForm" action="./content.jsp" method="post" id="hiddenForm">
	<input type="hidden" name="idx" id="idx"/>
	<input type="hidden" name="regnum" id="regnum"/>
	<input type="hidden" name="lvl" id="lvl"/>
	<input type="hidden" name="combine" id="combine"/>
	<input type="hidden" name="ord" id="ord"/>
	<input type="hidden" name="delnum" id="delnum"/>
	<input type="hidden" name="hMenuID" value="<%=hMenuID %>"/>
	<input type="hidden" name="lMenuID" value="<%=lMenuID %>"/>
</form>
	<div>
		<span>list</span>
	</div>
	<div>
		<a href="./list.jsp">홈으로</a>
	</div>
	<div>
		<a href="./02_client/01_boards/write.jsp">글쓰기</a>
	</div>
	<div>
		<a href="./02_client/01_boards/list.jsp">글목록</a>
	</div>
<!-- 상단메뉴테이블시작 -->
<div>
<table width="800px" align="center" border="1" cellpadding="0" cellspacing="0">
	<tr id="hMenus">
	</tr>
</table>
</div>
<!-- 상단메뉴테이블끝 -->
<!-- 하단메뉴테이블시작 -->
<div>
<table width="800px" align="center" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td width="200px" height="600px" align="center" valign="top">
			<!-- 서브메뉴테이블 -->
			<div id="LMenus"></div>
		</td>
		<td width="600px" height="600px" align="center" valign="top">
			<!-- 로그인시작 -->
			<div id="login">
			<%if(loginID==null){ %>
				<form method="post" action="./login_ok.jsp" name="loginForm">
					<div id="chkMsg"></div>
					아이디 : <input type="text" name="userID" id="userID" onblur="checkID()"/>&nbsp;&nbsp;
					비밀번호 : <input type="password" name="userPass" id="userPass"/>&nbsp;&nbsp;
					<!-- ajax login -->
					<!--<input type="button" value="로그인" onclick="userLogin()"/>  -->
					<!-- ajax login end -->
					<input type="submit" value="로그인"/>
				</form>
			<%}else{%>
				<div><%=loginID %> 계정으로 로그인됨</div>
				<input type='button' value='로그아웃' onclick='userLogout()'/>
			<%} %>
			</div>
			<!-- 로그인끝 -->
			<!-- 내용시작 -->
			<%if(loginID!=null){ %>
			<div id="boards"></div>
				<%if(lMenuID!="" && lMenuID!=null){ %>
			<div>
				<input type="button" value="글쓰기" onclick="goWrite()"/>
			</div>
				<%}%>
				
			<%}else{%>
				<div>로그인 후 내용이 표시됩니다</div>
			<%}%>
			<!-- 내용끝 -->
		</td>
	</tr>
</table>
</div>
<!-- 하단메뉴테이블끝 -->
</body>
</html>