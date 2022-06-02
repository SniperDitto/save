<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>members list</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="/jscss/js/common.js"></script>
<script>
var ajaxObj = function(url, type, vars, params, async, dataType, sucFunc, errFunc){
	this.url = url;
	this.type = type;
	this.data = null;
	this.vars = vars;
	this.params = params;
	this.async = async;
	this.dataType = dataType;
	this.sucFunc = sucFunc;
	this.errFunc = errFunc;
	
	this.toJson = function(){
		
		var strJson = "";
		strJson += "{";
			for(var i=0;i<vars.length;i++){
				strJson += "\"" + this.vars[i] + "\"";
				strJson += ":";
				strJson += "\"" + this.params[i] + "\"";
				if(i != vars.length - 1){
					strJson += ",";
				}
			}
		strJson += "}";
		
		this.data = JSON.parse(strJson);			
	};
	
	this.ajaxExec = function(){
		$.ajax(
				{
					url : this.url,
					data : this.data,//{sid: "", sname:""}
					type : this.type,
					async : this.async,
					dataType : this.dataType,
					
					success : this.sucFunc
					,
					error : this.errFunc
					
				} 
			); 
	};
	
};
	var selectMemberList = function(){
		var url = "jsonMemberList";
		var type = "post";
		var async = true;
		var vars = ["searchText"];
		var params = [$("#searchText").val()];
		var dataType = "json";
		var sucFunc = function(data){
			$(data).each(function(){
				alert(this);
				//html 만들어서 쏴주기
			});
		}
		var failFunc = function(err){
			alert("쉴패~~!~!!~!~! : "+err);
		}
		
		var obj = new ajaxObj(url, type, vars, params, async, dataType);
		obj.toJson();
		obj.ajaxExec();
	}
	
	$(document).ready(function(){
		selectMemberList();
	});
</script>
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
		width:700px;
		border:0px solid red;
		clear:both;
	}
	.col1{
		border:1px solid #444;
		width:50px;
		padding:2px 0px 3px 0px;
		display:block;
		text-align:center;
		float:left;
	}
	.col2{
		border:1px solid #444;
		width:170px;
		padding:4px 0px 5px 0px;
		display:block;
		text-align:center;
		float:left;
	}
	.col3{
		border:1px solid #444;
		width:170px;
		padding:4px 0px 5px 0px;
		display:block;
		text-align:center;
		float:left;
	}
	.col4{
		border:1px solid #444;
		width:280px;
		padding:4px 0px 4px 0px;
		display:block;
		text-align:center;
		float:left;
	}
	.col5{
		border:1px solid #444;
		width:10px;
		padding:4px 0px 4px 0px;
		display:block;
		text-align:center;
		float:left;
	}
</style>
</head>
<body>
<div id="wrap">
	<div class="search">
		<input type="text" id="searchText" name="searchText"/>&nbsp;&nbsp;&nbsp;
		<input type="button" value="조회" id="btnSearch"/>
		<input type="button" value="추가" id="btnAdd"/>
		<input type="button" value="저장" id="btnSave"/>
		<input type="button" value="삭제" id="btnDelete"/>
	</div>
	<div class="title">
		
	</div>
	<div class="row">
		<span>
			<input type="checkbox" name="chkT" value="" class="col1"/>
		</span>
		<span class="col2">회원ID</span>
		<span class="col3">회원이름</span>
		<span class="col4">회원권한</span>
		<span class="col5">&nbsp;</span>
	</div>
	<div class="row">
		<span class="col1">
			<input type="checkbox" name="chk" value=""/>
		</span>
		<span>
			<input type="text" name=mID value="" class="col2" readonly/>
		</span>
		<span>
			<input type="text" name="mName" value="" class="col3"/>
		</span>
		<span>
			<select name="authID" class="col4">
				<option value=""></option>
			</select>
		</span>
		<span>
			<input type="text" name="" value="" class="col5"/>
		</span>
	</div>
</div>
</body>
</html>