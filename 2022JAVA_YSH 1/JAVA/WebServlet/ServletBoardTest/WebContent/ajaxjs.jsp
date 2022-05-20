<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>a</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnOk").click(clickFunc);
	});
	
	var clickFunc = function(){
		alert("clickFunc");
		
		var vars = [];
		vars[0] = "sid";
		vars[1] = "sname";
		vars[2] = "sinfo";
		vars[3] = "jspURL";
		
		var params = [];
		params[0] = "123123";
		params[1] = "123123123";
		params[2] = "asdfasdfsafasdfasdasdf";
		params[3] = "ajaxJSON";
		
		//function(url, type, async, dataType, success, error, vars, params)
		var objA = new getAjaxObj("stock.do", "get", true, "json", successFunc, errorFunc, vars, params);
		alert(objA);
		objA.dataFunc();
		objA.ajaxExec();
		
		/*
		$.ajax({
			url : "stock.do",
			data : {
				jspURL : "ajaxJSON",
				sid : "123",
				sname : "asdf",
				sinfo : "asdfasdfasdf"
			},
			type : "get",
			async : true,
			dataType : "json",
			success : function(obj){
				var strHTML = "";
				$(obj).each(function(){
					strHTML += "<div>";
					strHTML += this.sid +"/"+ this.sname +"/"+ this.sinfo;
					strHTML += "</div>";
				});
				$("#msg").html(strHTML);
			},
			error : function(){
				alert("쉴패~~!~!");
			}
		});
		*/
	}
	
	//"stock.do","get",true,"json",successFunc,errorFunc,vars,params
	var getAjaxObj = function(url, type, async, dataType, success, error, vars, params){
		this.url = url;
		this.data = null;
		this.type = type;
		this.async = async;
		this.dataType = dataType;
		this.success = success;
		this.error = error;
		this.vars = vars;
		this.params = params;
		this.dataFunc = function(){
			var strJson = "";
			strJson += "{";
			for(var i=0;vars.length;i++){
				strJson += "\""+this.vars[i]+"\"";
				strJson += ":";
				strJson += "\""+this.params[i]+"\"";
				
				if(i != vars.length-1){
					strJson += ",";
				}
				
			}
			strJson += "}";
			
			var obj = JSON.parse(strJson);
			this.data = obj;
		};
		this.ajaxExec = function(){
			$.ajax({
				url : this.url,
				data : this.data,
				type : this.type,
				async : this.async,
				dataType : this.dataType,
				success : function(data , textStatus , jqXHR){
					this.success(data);
				},
				error : function(jqXHR, textStatus, errorThrown){
					this.error;
				}
			});
		};
	}
	
	
	var successFunc = function(obj){
		var strHTML = "";
		$(obj).each(function(){
			strHTML += "<div>";
			strHTML += this.sid +"/"+ this.sname +"/"+ this.sinfo;
			strHTML += "</div>";
		});
		$("#msg").html(strHTML);
	}
	
	var errorFunc = function(){
		alert("쉴패~~!~!");
	}
	
	
</script>
</head>
<body>
	<div id="msg"></div>
	<input type="button" value="확인" id="btnOk"/>
</body>
</html>