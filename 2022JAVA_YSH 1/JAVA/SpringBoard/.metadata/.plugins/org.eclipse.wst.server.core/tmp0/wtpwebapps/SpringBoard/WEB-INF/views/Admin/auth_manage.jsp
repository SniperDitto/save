<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auth_manage</title>
</head>
<body>

<%
	String loginID = (String)request.getAttribute("adminID");
	out.println(loginID+" 계정으로 로그인");
%>

<table cellpadding="0" cellspacing="0" width="1250px" height="800px" align="center" border="1px">
	<tr>
		<td width="1250px" height="40px" align="center" valign="middle">
			<table cellpadding="0" cellspacing="0" width="600px">
				<tr>
					<td width="120px" height="40px" align="center"><a href="authList" target="bodyFrame">권한관리</a></td>
					<td width="120px" height="40px" align="center"><a href="memberList" target="bodyFrame">회원관리</a></td>
					<td width="120px" height="40px" align="center">메뉴관리</td>
					<td width="120px" height="40px" align="center"><a href="programList" target="bodyFrame">프로그램관리</td>
					<td width="120px" height="40px" align="center">권한별상세관리</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="1250px" height="590px" align="center" valign="middle">
			<iframe name="bodyFrame" style="width:1250px;height:580px;border:1px solid red"></iframe>
		</td>
	</tr>
</table>
</body>
</html>