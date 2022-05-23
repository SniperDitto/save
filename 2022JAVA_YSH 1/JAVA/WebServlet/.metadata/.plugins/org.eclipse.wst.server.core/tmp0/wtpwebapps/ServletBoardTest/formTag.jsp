<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>
<script>
	//hidden 값 붙여서 submit하기
	var objSubmit = function(names, vals){
		
		var strHidden = "";
		for(var i=0;i<names.length;i++){
			strHidden += "<div>";
			strHidden += "<input type='hidden' name='"+names[i]+"' value='"+vals[i]+"'/>"
			strHidden += "</div>";
		}
		document.getElementById("form1").innerHTML += strHidden;
		document.getElementById("form1").submit();
	}
	
	var objSubmit2 = function(names, vals){
		
		var strHidden = "";
		for(var i=0;i<names.length;i++){
			strHidden += "<div>";
			strHidden += "<input type='hidden' name='"+names[i]+"' value='"+vals[i]+"'/>"
			strHidden += "</div>";
		}
		document.getElementById("div1").innerHTML += strHidden;
		document.getElementById("form1").submit();
	}
	
	var objectSubmit = function(formID, formAction, formMethod, hiddenNames, hiddenVals){
		this.formID = formID;
		this.formAction = formAction;
		this.formMethod = formMethod;
		this.hiddenNames = hiddenNames;
		this.hiddenVals = hiddenVals;
		
		this.aSubmit = function(names, vals){
			var strHidden = "<form action='"+this.formAction+"' method='"+this.formMethod+"' id='"+this.formID+"'>";
			for(var i=0;i<hiddenNames.length;i++){
				strHidden += "<div>";
				strHidden += "<input type='hidden' name='"+this.hiddenNames[i]+"' value='"+this.hiddenVals[i]+"'/>"
				strHidden += "</div>";
			}
			strHidden += "</form>";
			document.getElementById(this.formID).innerHTML += strHidden;
			document.getElementById(this.formID).submit();
		}
		this.formSubmit = function(names, vals){
			var strHidden = "";
			for(var i=0;i<hiddenNames.length;i++){
				strHidden += "<div>";
				strHidden += "<input type='hidden' name='"+this.hiddenNames[i]+"' value='"+this.hiddenVals[i]+"'/>"
				strHidden += "</div>";
			}
			
			document.getElementById(this.formID).innerHTML += strHidden;
			document.getElementById(this.formID).submit();
		}
	}
	
	var go = function(){
		var names = ["idx","ref","combine","jspURL"];
		var vals = [1,2,3,"list"];
		objSubmit(names, vals);
	}
	
	var go2 = function(){
		var names = ["idx","ref","combine","jspURL"];
		var vals = [1,2,3,"list"];
		objSubmit2(names, vals);
	}
	
	
</script>
</head>
<body>
	<form name="form1" id="form1" action="stock.do" method="post">
		<div>
			<input type="text" name="id"/>
			<input type="text" name="name"/>
			<input type="button" value="확인" onclick="go()"/>
		</div>
		<input type="hidden" name="idx" value="1"/>
	</form>
	
	
	<div id="div1">
	<a href="javascript:go2()">go</a>
	</div>
</body>
</html>