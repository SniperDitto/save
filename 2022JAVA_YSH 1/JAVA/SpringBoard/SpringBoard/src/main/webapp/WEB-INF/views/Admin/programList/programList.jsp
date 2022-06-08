<%@page import="pkg.admin.DTO.MenuDTO"%>
<%@page import="pkg.admin.DTO.ProgramDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="/jscss/js/common.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#btnSave").click(function(){
			var sendData = {};
			var datas = [];//sendData는 배열로 이루어진 객체, datas는 객체들의 배열, objRow는 데이터 하나를 가리키는 객체
			var objRow = {};
			var pid = "";
			var menuid = "";
			var fileName = "";
			var fileUrl = "";
			for(var i=0;i<$("input[name='pid']").length;i++){
				objRow.pid=$("input[name='pid']").eq(i).val();
				objRow.menuID=$("select[name='menuID']").eq(i).val();
				objRow.fileName=$("input[name='fileName']").eq(i).val();
				objRow.fileUrl=$("input[name='fileUrl']").eq(i).val();
				datas.push(objRow);
			}
		});
	});
	
</script>
</head>
<body>
<%
	List<ProgramDTO> programList = (List<ProgramDTO>)request.getAttribute("programList");
	List<MenuDTO> menuList = (List<MenuDTO>)request.getAttribute("menuList");
%>
<div>
	<input type="text" name="search" id="search" value=""/>&nbsp;&nbsp;&nbsp;
	<input type="button" value="조회" id="btnSearch"/>
	<input type="button" value="추가" id="btnAdd"/>
	<input type="button" value="저장" id="btnSave"/>
	<input type="button" value="삭제" id="btnDelete"/>
</div>
<div class="row">
	<span class="col1">
		<input type="checkbox" name="chkT" id="chkT" />
	</span>
	<span class="col2">아이디</span>
	<span class="col4">프로그램명</span>
	<span class="col2">연결메뉴</span>
	<span class="col2">JSP</span>
	<span class="col2">URL</span>
	<span></span>
</div>
	<% for(ProgramDTO pdto : programList){ %>
		<div class="row">
			<span class="col1">
				<input type="checkbox" name="chk"/>
			</span>
			<span class="col2">
				<input type="text" name="pid" value="<%=pdto.getpID() %>" readonly/>
			</span>
			<span class="col4"><%=pdto.getpName() %></span>
			<span class="col2">
				<select name="menuID">
					<option value="">---선택---</option>
				<% for(MenuDTO mdto : menuList){ %>
					<option value="<%=mdto.getMenuID() %>"><%=mdto.getMenuName() %></option>
				<%} %>
				</select>
			</span>
			<span class="col2"><%=pdto.getpFileName() %></span>
			<span class="col2"><%=pdto.getFileUrl() %></span>
			<span></span>
		</div>
	<%} %>
</body>
</html>