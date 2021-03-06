<%@page import="oracle.jdbc.OracleTypes"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>글목록</title>
<script>
	$(function(){
		$("#chkAll").click(function(){
			if($("#chkAll").prop('checked')){
				$("input[name='chk']").prop('checked',true);
			}
			else{
				$("input[name='chk']").prop('checked',false);
			}
		});
	});
</script>
</head>
<body>
<%
	
	//90년대 말 고대 코딩 스타일...
	
	
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
		String procName = "{call PKG_BOARDS.PROC_SEL_BOARD(?,?)}";
		
		cs = dbCon.prepareCall(procName);
		cs.setString(1, "");
		cs.registerOutParameter(2, OracleTypes.CURSOR);
		
		cs.executeQuery();
		
		rs = (ResultSet) cs.getObject(2);
		
		
		
		//데이터 보여주기
%><form method="get" action="./delete.jsp" >
	<table cellpadding="0" cellspacing="0" width="600px" align="center" border="1">
		<tr>
			<td width="50px" height="30px" align="center">
				<input type="checkbox" name="chkAll" id="chkAll"/>
			</td>
			<td width="50px" height="30px" align="center">
				글번호
			</td>
			<td width="250px" height="30px" align="center">
				제목
			</td>
			<td width="100px" height="30px" align="center">
				작성자
			</td>
			<td width="100px" height="30px" align="center">
				작성일
			</td>
		</tr>
		<% while(rs.next()){%>
		<tr>
			<td width="50px" height="30px" align="center">
				<input type="checkbox" name="chk" id="chk" value="<%=rs.getString("IDX")%>"/>
			</td>
			<td width="50px" height="30px" align="center">
				<%=rs.getString("IDX")%>
			</td>
			<td width="250px" height="30px" align="center">
				<a href="./contents.jsp?idx=<%=rs.getString("IDX")%>" name="idx"><%=rs.getString("TITLE")%></a>
			</td>
			<td width="100px" height="30px" align="center">
				<%=rs.getString("USERID")%>
			</td>
			<td width="100px" height="30px" align="center">
				<%=rs.getString("REGDATES")%>
			</td>
		</tr>
<%		}%>
		<tr>
			<td width="650px" height="30px" colspan="5">
				<a href="./write.jsp">글쓰기</a>
				<a href="../../index.jsp">홈으로</a>
				<button>선택글삭제</button>
			</td>
		</tr>
	</table>
</form>
<%
		rs.close();
		cs.close();
		dbCon.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>

	







</body>
</html>