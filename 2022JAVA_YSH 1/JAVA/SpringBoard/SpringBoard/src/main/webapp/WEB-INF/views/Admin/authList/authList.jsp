<%@page import="pkg.admin.DTO.AuthDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AuthList</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="jscss/js/common.js"></script>
<script type="text/javascript" src="jscss/js/authList/authList.js"></script>
<script>
$(document).ready(function(){
    $("#btnSearch").on("click",function(){
        location.href="authList?authName="+$("#authName").val();
    });
    
    $("#btnAdd").click(function(){
    	var strHTML = "";
    	strHTML += '<tr>';
    	strHTML += '<td width="100px" height="30px" align="center">';
    		strHTML += '<input type="checkbox" name="chk" value="0"/>';
    	strHTML += '</td>';
    	strHTML += '<td width="200px" height="30px" align="center">db에서 받은 새 authID</td>';
    	strHTML += '<td width="400px" height="30px" align="center"><input type="text" name="authName2" id="" value=""/></td>';
		strHTML += '</tr>';
		
		$("#authTbl").append(strHTML);
    });
});
</script>
</head>
<body>
<%
	List<AuthDTO> list = (List<AuthDTO>)request.getAttribute("authList");
	String authName = (request.getAttribute("authName")==null)? "" : (String)request.getAttribute("authName");

%>
<table cellpadding="0" cellspacing="0" width="700px" align="center" border="1px" id="authTbl">
	<tr>
		<td width="700px" height="30px" align="center" colspan="3">
			<input type="text" name="authName" id="authName" value="<%=authName %>"/>&nbsp;&nbsp;&nbsp;
			<input type="button" value="조회" id="btnSearch"/>
			<input type="button" value="추가" id="btnAdd"/>
			<input type="button" value="저장" id="btnSave"/>
			<input type="button" value="삭제" id="btnDelete"/>
		</td>
	</tr>
	<tr>
		<td width="100px" height="30px" align="center">
			<input type="checkbox" name="chk" value=""/>
		</td>
		<td width="200px" height="30px" align="center">권한ID</td>
		<td width="400px" height="30px" align="center">권한이름</td>
	</tr>
	<% int index=1;
	for(AuthDTO dto : list){%>
		<tr>
		<td width="100px" height="30px" align="center">
			<input type="checkbox" name="chk" value="<%=index %>"/>
		</td>
		<td width="200px" height="30px" align="center"><%=dto.getAuthID() %></td>
		<td width="400px" height="30px" align="center">
			<input type="textbox" name="" id="" value="<%=dto.getAuthName() %>"/>
		</td>
	</tr>
	<% index++;
	}%>
</table>

</body>
</html>