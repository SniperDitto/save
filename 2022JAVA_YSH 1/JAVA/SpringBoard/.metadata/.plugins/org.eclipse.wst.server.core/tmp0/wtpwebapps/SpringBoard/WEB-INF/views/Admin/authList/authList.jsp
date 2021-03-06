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
<script type="text/javascript" src="/jscss/js/common.js"></script>
<script type="text/javascript" src="/jscss/js/authList/authList.js"></script>
<script>
$(document).ready(function(){
    $("#btnSearch").on("click",function(){
        location.href="authList?authNameSearch="+$("#authNameSearch").val();
    });
    
    $("#btnAdd").click(function(){
    	addFunc();
    });
    
    $("input[name='authName']").change(function(){
    	authNameChg();
    });
    
    $("#btnSave").click(function(){
    	saveFunc();
    });
    
    $("#chkT").on("click",function(){
    	chkAll();
    });
    
    
    $("#btnDelete").click(function(){
    	
    });
    
    
});//document.ready

var addFunc = function(){
	var strHTML = "";
	strHTML += '<tr style="background-color:#BBB">';
	strHTML += '<td width="100px" height="30px" align="center">';
		strHTML += '<input type="checkbox" name="chk" value="0"/>';
	strHTML += '</td>';
	strHTML += '<td width="200px" height="30px" align="center"><input type="text" name="authID" id="" value="" readonly/></td>';
	strHTML += '<td width="400px" height="30px" align="center"><input type="text" name="authName" id="" value=""/></td>';
	strHTML += '<td width="30px" height="30px" align="center">';
		strHTML += '<input type="text" style="width:10px" name="gbn" value="i"/>';
	strHTML += '</td>';
	strHTML += '</tr>';
	
	$("#authTbl").append(strHTML);
}

var authNameChg = function(){
	var chgIdx = $("input[name='authName']").index(this);
	//alert(chgIdx);
	$("input[name='gbn']").eq(chgIdx).val("u");
	//boardContent 밑의 idx번째 boardRow
	$("#authTbl tr").eq(chgIdx+2).children().css("background-color","#BBB");
}

var saveFunc = function(){
	//빈 값 처리
	var isOK = true;
	$("input[name='authName']").each(function(){
		if($(this).val=="" || $(this).val==null){
			isOK = false;
		}
	});
	if(!isOK){
		alert("입력되지 않은 값이 있습니다");
		return;
	}
	$("#authListForm").attr("action","saveAuthList");
	$("#authListForm").submit();
}

var chkAll = function(){
	$("input[name='chk']").each(function(){
		if($("#chkT").prop("checked")){
			$(this).prop("checked",true);
    	}else{
    		$(this).prop("checked",false);
    	}
	});
}

var delFunc = function(){
	var delHTML = '';
	
	delHTML += '<form name="delForm" id="delForm" method="post">';
	$("input[name='chk']").each(function(){
		if($(this).is(":checked")){
			delHTML += '<input type="hidden" name="authID" value="'+"delIdx ->authID"+'"/>';
		}
	});
	delHTML += '</form>';
	
	
	$("#delFormDiv").html(delHTML);
	$("#delForm").attr("action","deleteBoard");
	$("#delForm").submit();
}



</script>
</head>
<body>
<%
	List<AuthDTO> list = (List<AuthDTO>)request.getAttribute("authList");
	String authNameSearch = (request.getAttribute("authNameSearch")==null)? "" : (String)request.getAttribute("authNameSearch");

%>
<form name="authListForm" id="authListForm" method="post">
<table cellpadding="0" cellspacing="0" width="700px" align="center" border="1px" id="authTbl">
	<tr>
		<td width="700px" height="30px" align="center" colspan="3">
			<input type="text" name="authNameSearch" id="authNameSearch" value="<%=authNameSearch %>"/>&nbsp;&nbsp;&nbsp;
			<input type="button" value="조회" id="btnSearch"/>
			<input type="button" value="추가" id="btnAdd"/>
			<input type="button" value="저장" id="btnSave"/>
			<input type="button" value="삭제" id="btnDelete"/>
		</td>
	</tr>
	<tr>
		<td width="100px" height="30px" align="center">
			<input type="checkbox" name="chkT" id="chkT" value=""/>
		</td>
		<td width="200px" height="30px" align="center" name="authIdT">권한ID</td>
		<td width="400px" height="30px" align="center" name="authNameT">권한이름</td>
		<td width="30px" height="30px" align="center">
			<input type="text" style="width:10px" name="gbnT" value=""/>
		</td>
	</tr>
	
		<% int index=1;
		for(AuthDTO dto : list){%>
			<tr>
			<td width="100px" height="30px" align="center">
				<input type="checkbox" name="chk" value="<%=index %>"/>
			</td>
			<td width="200px" height="30px" align="center" name="authID">
				<input type="text" name="authID" id="" value="<%=dto.getAuthID() %>" readonly/>
			</td>
			<td width="400px" height="30px" align="center">
				<input type="text" name="authName" id="" value="<%=dto.getAuthName() %>"/>
			</td>
			<td width="30px" height="30px" align="center">
				<input type="text" style="width:10px" name="gbn" value=""/>
			</td>
		</tr>
		<% index++;
		}%>
	
</table>
</form>
<div id="delFormDiv"></div>
</body>
</html>