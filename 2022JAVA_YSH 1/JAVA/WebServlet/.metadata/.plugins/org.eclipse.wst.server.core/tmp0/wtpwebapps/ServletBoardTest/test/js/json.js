

var ajaxResultFunc = function(){
	$(result).each(function(){
		
	});
}
var ajaxErrorFunc = function(){
	
}

var ajaxFunc = function(strURL, jsonVars, jsonParams, isAsync, strType, ajaxResultFunc, ajaxErrorFunc){
		$.ajax({
			url : strURL,
			data : toJsonObj(jsonVars, jsonParams),
			dataType : "json",
			async : isAsync,
			type : strType,
			success : ajaxResultFunc,
			error : ajaxErrorFunc
		});
}

var objAjax = function(strURL, jsonVars, jsonParams, isAsync, strType, ajaxResultFunc, ajaxErrorFunc){
	this.strURL = strURL;
	this.jsonVars = jsonVars;
	this.jsonParams = jsonParams;
	this.isAsync = isAsync;
	this.strType = strType;
	this.ajaxResultFunc = ajaxResultFunc;
	this.ajaxErrorFunc = ajaxErrorFunc;
	this.sendData = null;
	this.toJsonObj = function(){
		//'{"id":"USER03","name":"홍길동","gender":"M","age":25}'
		var strJson = "";
		strJson += "{";
		for(var i=0;vars.length;i++){
			strJson += '"'+this.jsonVars[i]+'"';
			strJson += ":";
			strJson += '"'+this.jsonParams[i]+'"';
			
			i!=(vars.length-1) ? strJson+="," : strJson+="" ;
			
		}
		strJson += "}";
		
		var objJson = JSON.parse(strJson);
		this.sendData = objJson;
	}
	this.execAjax = function(){
		$.ajax({
			url : this.strURL,
			data : this.toJsonObj(),
			dataType : "json",
			async : this.isAsync,
			type : this.strType,
			success : this.ajaxResultFunc,
			error : this.ajaxErrorFunc
		});
	}
}

var ajaxFunc2 = function(objAjax){
		$.ajax({
			url : objAjax.strURL,
			data : objAjax.toJsonObj(jsonVars, jsonParams),
			dataType : "json",
			async : objAjax.isAsync,
			type : objAjax.strType,
			success : objAjax.ajaxResultFunc,
			error : objAjax.ajaxErrorFunc
		});
}
	
var vars = [];
	vars[0] = "userID";
	vars[1] = "userName";
	vars[2] = "gender";
	vars[3] = "age";
	
var params = [];
	params[0] = "USER01";
	params[1] = "홍";
	params[2] = "M";
	params[3] = 25;
	
	
var obj = {id : "USER01", name : "완", gender : "M"};
var obj2 = {};
	obj2.id = "USER02";
	obj2.name = "최밥창문";
	obj2.gender = "F";
	
//var strJson = JSON.stringify(obj);
//var strJson = '{"id":"USER03","name":"홍길동","gender":"M","age":25}';




