<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../jquery/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var student = function(studID, studName, studAge){
		this.studID=studID;
		this.studName=studName;
		this.studAge=studAge;
	}
	
	var stu1 = student("S01","asdf",23);
	var students = [];
	students[0] = new student("S01","asdf",23);
	students[1] = new student("S02","qwer",26);
	students[2] = new student("S03","zxcv",25);
	students[3] = new student("S04","tyui",24);
	
	var showList=function(){
		var strHTML="";
		
		for(var i=0;i<students.length;i++){
			strHTML+='<div class="b2">';
			strHTML+='<span class="b1"><label><input type="checkbox" name="chk"/></label></span>';
			strHTML+='<span class="b1">'+students[i].studID+'</span>';
			strHTML+='<span class="b1">'+students[i].studName+'</span>';
			strHTML+='<span class="b1">'+students[i].studAge+'</span>';
			strHTML+="</div>";
		}
		
		document.getElementById("msg").innerHTML = strHTML;
	}
	
	var f1 = function(){
		$("input[name='chkAll']").click(function(){
			if($(this).is(":checked")){
				$("input[name='chk']").prop('checked',true);
			}
			else{
				$("input[name='chk']").prop('checked',false);
			}
			
		});
		$("input[name='chk']").click(function(){
			
		});
	}
</script>
<style>
	.b1{
		width:150px;
		height:20px;
		font-size:20px;
		color:#444;
		text-align:center;
		padding:0px 10px 10px 0px;
		border:1px solid #333;
		display:block;
		float:left;
	}
	.b2{
		clear:both;
	}
</style>
</head>
<body onload="f1()">
	<div>
		<input type="button" value="목록" onclick="showList()"/>
	</div>
	<div>
		<span class="b1">
			<label><input type="checkbox" name="chkAll"/></label>
		</span>
		<span class="b1">학생ID</span>
		<span class="b1">이름</span>
		<span class="b1">나이</span>
	</div>
	<div id="msg">
		
	</div>
</body>
</html>