<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<title>json</title>
</head>
<body>
<script>
	var toJsonObj = function(vars, params){
	
		var strJson = "";
		//'{"id":"USER01", "name":"ȫ�浿", "gender":"����", "age":34}';
		
		strJson += "{";
		
			for(var i=0;i<vars.length;i++){
				strJson += "\"" + vars[i] + "\"";
				strJson += " : ";
				strJson += "\"" + params[i] + "\"";
				
				if(i != vars.length - 1){
					strJson += ",";
				}
			}
		
		strJson += "}";
		
		var objJson = JSON.parse(strJson);
		
		return objJson;
		
	}
	
	var ajaxFunc = function(strUrl, jsonVars, jsonParams, strAsync, strType, ajaxResultFunc, ajaxErrorFunc){
		$.ajax({
				url : strUrl,
				data : toJsonObj(jsonVars, jsonParams),
				dataType : "json",
				async : strAsync,
				type : strType,
				success : ajaxResultFunc,
				error : ajaxErrorFunc
		});
	}
	
	var ajaxResultFunc = function(result){
		$(result).each(function(){
			alert("asdf");
		});
	}
	
	var ajaxErrorFunc = function(){
		alert("쉴패~!~~!");
	}
	
	var vars = [];
	vars[0] = "userID";
	vars[1] = "userName";
	vars[2] = "age";
	var params = [];
	params[0] = "user01";
	params[1] = "ȫ�浿";
	params[2] = 34;
	
	ajaxFunc("json.jsp", vars, params, true, "get", ajaxResultFunc, ajaxErrorFunc);
</script>
<div id="msg">1</div>

</body>
</html>