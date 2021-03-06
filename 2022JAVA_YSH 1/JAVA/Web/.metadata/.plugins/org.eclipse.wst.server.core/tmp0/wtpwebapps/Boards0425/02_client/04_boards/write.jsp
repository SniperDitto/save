<%@page import="Pkg.Client.Menus.LmenuVO"%>
<%@page import="Pkg.Client.Menus.HmenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Pkg.Client.Menus.MenuService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="Pkg.Client.Boards.BoardVO"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript" src="./js/board.js"></script>
<style>
	body{
		margin:0px;
		padding:0px;
	}
</style>
<%
	request.setCharacterEncoding("UTF-8");
	String loginID = (String)session.getAttribute("userID");
	String hMenuID = request.getParameter("hMenuID");
	String lMenuID = request.getParameter("lMenuID");
	out.print("대분류 : "+hMenuID);
	out.print(" / 소분류 : "+lMenuID);
	out.print(" / 로그인한 사람 : "+loginID);
	
	if(loginID==null){
		response.sendRedirect("./list.jsp");
	}
	
%>
<script type="text/javascript">

var init = function(){
	getHMenuList();
	getLMenuList("<%=hMenuID %>");
	getHMenuSel("<%=hMenuID %>");
	getLMenuSel("<%=hMenuID %>","<%=lMenuID %>");
}
var sendList = function(){
	location.href = "./list.jsp?hMenuID=<%=hMenuID %>&lMenuID=<%=lMenuID %>" ;
}
var hMenuSelChg = function(obj){
	getLMenuSel(obj.value, null);
	hMenuID = obj.value;
}
var lMenuSelChg = function(obj){
	lMenuID = obj.value;
}
</script>
</head>
<body onload="init()">

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
			<% }else{%>
				<div><%=loginID %> 계정으로 로그인됨</div>
				<input type='button' value='로그아웃' onclick='userLogout()'/>
			<% } %>
			</div>
			<!-- 로그인끝 -->
			<!-- 글쓰기시작 -->
			<div id="boards">
			<form action="./write_ok.jsp" method="post" name="boardForm" id="boardForm">
				<div id="hMenuSel"></div>
				<div id="lMenuSel"></div>
				<input type="text" name="title" id="title" style="width:590px" placeholder="글제목입력"/>
				<textarea type="text" name="content" id="content" style="width:590px;height:430px" placeholder="글내용입력"></textarea>
				
				<input type="hidden" name="idx" id="idx" value="0"/>
				<input type="hidden" name="regnum" id="regnum"/>
				<input type="hidden" name="lvl" id="lvl"/>
				<input type="hidden" name="combine" id="combine"/>
				<input type="hidden" name="ord" id="ord"/>
				<input type="hidden" name="delnum" id="delnum"/>
				<input type="hidden" name="hMenuID" value="<%=hMenuID %>"/>
				<input type="hidden" name="lMenuID" value="<%=lMenuID %>"/>
				
				<input type="submit" value="작성"/>
				<input type="button" onclick="sendList()" value="목록으로"/>
			</form>
			
			</div>
			<!-- 글쓰기끝 -->
		</td>
		
	</tr>
</table>
</div>
<!-- 하단메뉴테이블끝 -->

</body>
</html>