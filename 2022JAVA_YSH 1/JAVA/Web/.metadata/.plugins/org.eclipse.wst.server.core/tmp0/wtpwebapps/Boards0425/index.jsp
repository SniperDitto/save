<%@page import="Pkg.Client.Menus.LmenuVO"%>
<%@page import="Pkg.Client.Menus.HmenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Pkg.Client.Menus.MenuService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
	body{
		margin:0px;
		padding:0px;
	}
</style>
</head>
<body>
<%
	String hMenuID = request.getParameter("hMenuID");
	if(hMenuID==null){
		hMenuID="MENU01";
	}

	//대메뉴
	MenuService ms = new MenuService();
	ArrayList<HmenuVO> hList = ms.getHmenus();
	
	//소메뉴
	ArrayList<LmenuVO> lList = ms.getLmenus(hMenuID);
	
	
%>
	<div>
		<span>메인 페이지</span>
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
	<tr>
		<%for(HmenuVO h : hList){ %>
		<td width="120px" align="center" height="50px">
			<a href="index.jsp?hMenuID=<%=h.getMenuID() %>"><%=h.getMenuName() %></a>
		</td>
		<%} %>
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
			<div>
			<table width="200px" align="center" border="1" cellpadding="0" cellspacing="0" >
				<%for(LmenuVO l : lList){ %>
				<tr>
					<td width="200px" align="center" height="30px">
						<a href=""><%=l.getlMenuName() %></a>
					</td>
				</tr>
				<%} %>
			</table>
			</div>
		</td>
		<td width="600px" height="600px" align="center" valign="top">
			<!-- 로그인시작 -->
			<div>
				<jsp:include page="./02_client/02_members/include/login.jsp"></jsp:include>
			<!-- 
				<form name="loginForm" id="loginForm" method="post" action="./02_client/02_members/login_ok.jsp">
				<table width="600px" align="center" border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td width="600px" align="center">
							아이디 : <input type="text" name="userID" id="userID"/>&nbsp;&nbsp;
							비밀번호 : <input type="password" name="userPW" id="userPW"/>&nbsp;&nbsp;
							<input type="submit" value="로그인"/>
						</td>
					</tr>
				</table>
				</form> -->
			</div>
			<!-- 로그인끝 -->
		</td>
	</tr>
</table>
</div>
<!-- 하단메뉴테이블끝 -->
</body>
</html>