<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//servlet, spring
	//HttpSession s = request.getSession();
	//String userID = (String)s.getAttribute("userID");//로그인한 사람 id
	
	//jsp(session 객체 제공)
	String userID = (String)session.getAttribute("userID");
%>



	<%if(userID==null){ %>
<form name="loginForm" id="loginForm" method="post" action="/Boards0425/02_client/02_members/login_ok.jsp">
	<table width="600px" align="center" border="1" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="600px" height="50px" align="center">
				아이디 : <input type="text" name="userID" id="userID" />&nbsp;&nbsp; 
				비밀번호 : <input type="password" name="userPass" id="userPW" />&nbsp;&nbsp;
				<input type="submit" value="로그인" />
			</td>
		</tr>
	</table>
</form>
	<%} else{%>
	<form name="logoutForm" id="logoutForm" method="post" action="/Boards0425/02_client/02_members/logout.jsp">
		<%=userID %> 계정으로 로그인
		<input type="submit" value="로그아웃"/>
	</form>
	<%} %>
	
