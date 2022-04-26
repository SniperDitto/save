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
<meta charset="UTF-8">
<title>글 내용</title>
<script>
	var delFunc = function(){
		document.getElementById("contentForm").submit();
	}
</script>
</head>
<body>

	<%
	
	String strIDX = request.getParameter("idx");
	//strIDX 받아온 값으로 select 해서 받아오기
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
		
		
		//데이터 보여주기
%><form action="./delete.jsp" id="contentForm">
	<table cellpadding="0" cellspacing="0" width="600px" align="center" border="1">
		<% while(rs.next()){
		%>
		<tr>
			<td width="120px" height="30px" align="center">글번호</td>
			<td width="480px" height="30px" align="center" name="chk" value="<%=rs.getString("IDX")%>">
				<%=rs.getString("IDX")%>
			</td>
		</tr>
		<tr>
			<td width="120px" height="30px" align="center">작성자</td>
			<td width="480px" height="30px" align="center">
				<%=rs.getString("USERID")%>
			</td>
		</tr>
		<tr>
			<td width="120px" height="30px" align="center">글제목</td>
			<td width="480px" height="30px" align="center">
				<%=rs.getString("TITLE")%>
			</td>
		</tr>
		<tr>
			<td width="120px" height="30px" align="center">작성일</td>
			<td width="480px" height="30px" align="center">
				<%=rs.getString("REGDATE")%>
			</td>
		</tr>
		<tr>
			<td width="600px" height="120px" align="center" colspan="2">
				<%=rs.getString("CONTENT")%>
			</td>
		</tr>
<%		 }%>
		
		<tr>
			<td width="600px" height="30px" align="center" colspan="2">
				<a href="./list.jsp">글목록</a>
				<a href="javascript:delFunc()">글삭제</a>
				<a href="../../index.jsp">홈으로</a>
			</td>
		</tr>
	</table>
	</form>
<%
		cs.close();
		dbCon.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	
	
</body>
</html>