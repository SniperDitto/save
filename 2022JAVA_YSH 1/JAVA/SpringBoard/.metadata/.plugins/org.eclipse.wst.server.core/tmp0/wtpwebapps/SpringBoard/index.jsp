<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>

<style>
	body{
		margin:0px;
		padding:0px;
	}
</style>
</head>
<body>
index<br/>
<a href="boardsList">리스트</a>
<a href="list">리스트2</a>
<table cellpadding="0" cellspacing="0" width="1250px" height="800px" align="center" border="1px">
	<tr>
		<td width="700px" align="center" valign="middle">
			<form>
				<table cellpadding="0" cellspacing="0" width="400px" align="center" border="1px">
					<tr>
						<td width="100px" height="30px" align="center">ID</td>
						<td width="300px" height="30px" align="center">
							<input type="text" name="adminLoginID"/>
						</td>
					</tr>
					<tr>
						<td width="100px" height="30px" align="center">PW</td>
						<td width="300px" height="30px" align="center">
							<input type="password" name="adminLoginPW"/>
						</td>
					</tr>
					<tr>
						<td width="400px" height="30px" align="center" colspan="2">
							<!-- <input type="button" value="로그인"/> -->
							<a href="authManager">로그인<a>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>
</body>
</html>