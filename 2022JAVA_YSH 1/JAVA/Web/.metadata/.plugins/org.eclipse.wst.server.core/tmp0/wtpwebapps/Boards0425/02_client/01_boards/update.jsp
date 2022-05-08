<%@page import="oracle.jdbc.OracleTypes"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>글작성</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script>

	var chkVal = function(){
		var userID = $("#userID").val();
		var title = $("#title").val();
		var content = $("#content").val();
		/*if(userID.length<1){
			alert("작성자를 입력해주세요");
			$("#userID").focus();
			return false;
		}
		else */
			if(title.length<1){
			alert("글제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
		else if(content.length<1){
			alert("내용이 비어있습니다");
			$("#content").focus();
			return false;
		}
		
		$("#boardForm").submit();
		
	}

</script>
</head>
<body>
<%
	String strIDX = request.getParameter("idx");

	String id = "scores";
	String pw = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	try{
		//db연결
		Connection dbCon = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		dbCon = DriverManager.getConnection(url,id,pw);
		//select
		//O_CUR의 갯수가 여러개일 수도 있음(주의)
		String procName = "{call PKG_BOARDS.PROC_SEL_BOARD_CONTENT(?,?)}";
		
		cs = dbCon.prepareCall(procName);
		cs.setString(1, strIDX);
		cs.registerOutParameter(2, OracleTypes.CURSOR);
		
		cs.executeQuery();
		
		rs = (ResultSet) cs.getObject(2);
		while(rs.next()){
%>
	<div>
		글수정페이지
	</div>
	<div>
		<a href="../../index.jsp">home</a>
	</div>
	<form method="post" action="./update_ok.jsp" name="boardForm" id="boardForm" ><!-- onsubmit="return chkVal()" -->
	<input type="hidden" name="idx" value="<%=rs.getString("IDX")%>"/>
	<table cellpadding="0" cellspacing="0" width="600px" align="center" border="1">
		<tr>
			<td width="120px" height="30px" align="center">작성자</td>
			<td width="480px" height="30px" align="center" name="userID">
				<%=rs.getString("USERID")%>
		</tr>
		<tr>
			<td width="120px" height="30px" align="center">글제목</td>
			<td width="480px" height="30px" align="center">
				<input type="text" name="title" id="title" class="text1" style="width:470px;height:30px" value="<%=rs.getString("TITLE")%>"/>
			</td>
		</tr>
		<tr>
			<td width="600px" height="120px" align="center" colspan="2">
				<textarea name="content" id="content" class="text1" style="width:590px;height:230px"><%=rs.getString("CONTENT")%></textarea>
			</td>
		</tr>
		<tr>
			<td width="600" height="30px" align="center" colspan="2">
				<input type="button" value="수정" onclick="chkVal()"/>
			</td>
		</tr>
	</table>
	</form>
<%	
		}
	}catch(Exception e){
		e.printStackTrace();
	} %>
</body>
</html>