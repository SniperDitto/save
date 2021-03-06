<%@page import="pkg.admin.DTO.MenuDTO"%>
<%@page import="pkg.admin.DTO.ProgramDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProgramList</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<style>
		body{
			margin:0px;
			font-size:12px;
		}
	
		#wrap{
		
			
		
		}
		.search{
			width:700px;
			border:0px solid red;
			padding:4px 0px 4px 0px;
			
			clear:both;
		}
		
		.row{
			width:900px;
			border:0px solid red;
			/*padding:4px 0px 4px 0px;*/
			
			clear:both;
		}
		
		.col1{
			border:1px solid #444;width:50px;padding:3px 0px 3px 0px;display:block;
			text-align:center;float:left;
		}
		.col2{
			border:1px solid #444;width:150px;padding:4px 0px 5px 0px;display:block;
			text-align:center;float:left;
		}
		.col3{
			border:1px solid #444;width:150px;padding:4px 0px 5px 0px;display:block;
			text-align:center;float:left;
		}
		.col4{
			border:1px solid #444;width:230px;padding:4px 0px 5px 0px;display:block;
			text-align:center;float:left;
		}
		.col5{
			border:1px solid #444;width:150px;padding:4px 0px 5px 0px;display:block;
			text-align:center;float:left;
		}
	
	
	</style>
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
				objRow.pId=$("input[name='pid']").eq(i).val();
				objRow.pName=$("input[name='pName']").eq(i).val();
				objRow.menuID=$("select[name='menuID']").eq(i).val();
				objRow.fileName=$("input[name='fileName']").eq(i).val();
				objRow.fileUrl=$("input[name='fileUrl']").eq(i).val();
				datas.push(objRow);
			}
		});
		
		
		$("select[name='menuID']").change(function(){
			var selIdx = $(this).attr("idx");
			$("input[name='hiddenVal']").eq(selIdx).val("u");
		});
		$("input[name='fileName']").change(
				function(){
					var selectedIdx = $(this).attr("idx");
					
					$("input[name='hiddenVal']").eq(selectedIdx).val("U");
				}
		);
		
		$("input[name='fileUrl']").change(
				function(){
					var selectedIdx = $(this).attr("idx");
					
					$("input[name='hiddenVal']").eq(selectedIdx).val("U");
				}
		);
		
		
		$("#btnAdd").click(function(){
			getMenuList();
			//ajax로 실시간 변동되는 데이터를 가져와야 한다(목록 내용이 언제 바뀔지 모르므로)
			var strHTML = "";
			strHTML += '<div class="row">';
			strHTML += '<span class="col1"><input type="checkbox" name="chk" /></span>';
			strHTML += '<span class="col2"><input type="text" name="pid"  class="col2"/></span>';
			strHTML += '<span class="col4"></span>';
			strHTML += '<span class="col2">';
			strHTML += '<select name="menuID">';
			strHTML += '<option value="">---선택하세요---</option>';
			strHTML += '</select>';
			strHTML += '</span>';
			strHTML += '<span class="col2"><input type="text" name="fileName" class="col2"/></span>';
			strHTML += '<span class="col2"><input type="text" name="fileUrl"  class="col2"/></span>';
			strHTML += '<span><input type="text" name="hidVal" value="I"/></span>';
			strHTML += '</div>';
			
			$("#rows").append(strHTML);
		});
		
		
		$("#chkT").click(function(){
			if( $(this).prop("checked")){
				$("input[name='chk']").prop("checked", true);
			}else{
				$("input[name='chk']").prop("checked", false);
			}
		});
		
		
		$("#btnDelete").click(function(){
			
			if(!$("input[name='chk']").prop("checked")){
				$("#dialog").html("삭제할 데이터가 없어요");
				$("#dialog").dialog();
				return;
			}else{
				//삭제
				var sendData = {};
				var arrData = [];
				$("input[name='chk']").each(function(){
					//체크된것들 데이터를 json으로
					if($(this).prop("checked")){
						var rowData = {};
						rowData.pid = $(this).val();
						arrData.push(rowData);
					}
				});
				
				sendData.delPid = arrData;
				
				$.ajax({
					url : "delMenu",
					data : JSON.stringify(sendData),
					type : "post",
					async : true,//true 하면 row에 추가되기 전에 데이터를 받아버리기 때문
					dataType : "json",
					contentType : "application/json",
					success : function(data){
						
					},
					fail:function(){
						alert("쉴패.");
					},
					complete : function(){
						
					}
				});
				
				
			}
			
			
		});
		
		
		
	});//document
	
	
	var getMenuList = function(){
		//ajax 자체를 불러올 함수 쪽에서 작성하는게 좋음
		$.ajax({
			url : "menuList",
			//data : this.data,
			type : "post",
			async : false,//true 하면 row에 추가되기 전에 데이터를 받아버리기 때문
			dataType : "json",
			success : function(data){
				//ajax에서 왠만하면 리턴 안쓰는게 좋음
				//여기에서 불러와서 만들 strHTML을 만드는게 안전하다
				var strHTML = "";
				strHTML += '<div class="row">';
				strHTML += '<span class="col1"><input type="checkbox" name="chk" /></span>';
				strHTML += '<span class="col2"><input type="text" name="pid"  class="col2"/></span>';
				strHTML += '<span class="col4"><input type="text" name="pName" class="col4"/></span>';
				strHTML += '<span class="col2">';
				strHTML += '<select name="menuID">';
				strHTML += '<option value="">---선택하세요---</option>';
				$(data).each(function(){
					strHTML += '<option value="'+this.menuID+'">';
					strHTML += this.menuName+'</option>';
				});
				strHTML += '</select>';
				strHTML += '</span>';
				strHTML += '<span class="col2"><input type="text" name="fileName" class="col2"/></span>';
				strHTML += '<span class="col2"><input type="text" name="fileUrl"  class="col2"/></span>';
				strHTML += '<span><input type="text" name="hiddenVal" value="i"/></span>';
				strHTML += '</div>';
				
				//붙이기
				$("#row").append(strHTML);
			},
			fail:function(){
				alert("쉴패.");
			},
			complete : function(){
				
			}
		});
	}
	
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
	<% int i = 0; %>
	<% for(ProgramDTO pdto : programList){ %>
		<div class="row">
			<span class="col1">
				<input type="checkbox" name="chk"/>
			</span>
			<span class="col2">
				<input type="text" name="pid" value="<%=pdto.getpID() %>" readonly/>
			</span>
			<span class="col4"><input type="text" name="pName" value="<%=pdto.getpName() %>" readonly/></span>
			<span class="col2">
				<select name="menuID" idx="<%=i %>">
					<option value="">---선택---</option>
				<% for(MenuDTO mdto : menuList){ %>
					<option value="<%=mdto.getMenuID() %>" <% if(mdto.getMenuID().equals(pdto.getMenuID())){%>selected<%}%> >
						<%=mdto.getMenuName() %>
					</option>
				<%} %>
				</select>
			</span>
			<span class="col2"><%=pdto.getpFileName() %></span>
			<span class="col2"><%=pdto.getFileUrl() %></span>
			<span><input type="hidden" name="hiddenVal"/></span>
		</div>
	<% i++; %>
	<%} %>
	
	<div id="dialog" title=""></div>
	<div id=""></div>
</body>
</html>