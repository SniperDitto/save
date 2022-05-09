<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new menu(ajax)</title>
<script>
	var httpRequestH;
	var httpRequestL;
	var getHttpRequest=function(){
		httpRequestH = new XMLHttpRequest();
		httpRequestL = new XMLHttpRequest();
		/*
		if(window.XMLHttpRequest){
			httpRequest = new XMLHttpRequest();
		}else if(window.ActiveXObject){
			//IE6.0이하
			httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
		}
		*/
	}
	
	var callHMenuXml = function(){
		getHttpRequest();
		
		//통신이 완료되면 실행할 메서드
		httpRequestH.onreadystatechange = setHMenus;
		//get or post, 데이터 파일 경로, 동기인지(비동기인지)
		httpRequestH.open("post","./ajaxPages/getHmenus.jsp",true);
		httpRequestH.send();
	}
	
	var callLMenuXml = function(){
		
		var selLMenu = document.getElementById("hMenu").value;
		
		//통신이 완료되면 실행할 메서드
		httpRequestL.onreadystatechange = setLMenus;
		//get or post, 데이터 파일 경로, 동기인지(비동기인지)
		httpRequestL.open("post","/Boards0425/02_client/03_boards/ajaxPages/getLMenus.jsp?selLMenu="+selLMenu,true);
		httpRequestL.send();
	}
	
	var setHMenus=function(){
		var strHTML = "";
		var hMenuID = "";
		var hMenuName = "";
		//통신이 성공했는지 여부
		if (httpRequestH.readyState==4 && httpRequestH.status == 200){
			var objXML = httpRequestH.responseXML;
			var arrHMenu = objXML.getElementsByTagName("hMenu");
			
			for(var i=0;i<arrHMenu.length;i++){
				hMenuID = arrHMenu[i].childNodes[0].childNodes[0].nodeValue;
				hMenuName = arrHMenu[i].childNodes[1].childNodes[0].nodeValue;
				
				strHTML += "<option value='"+hMenuID+"'>";
				strHTML += hMenuName;
				strHTML += "</option>";
			}
			
		}
		//else{alert("쉴패~~!~!~");}
		
		document.getElementById("hMenu").innerHTML = strHTML;
		
	}
	
	var setLMenus = function(obj){
		var strHTML = "";
		var lMenuID = "";
		var lMenuName = "";
		var lMenuUrl = "";
		if (httpRequestL.readyState==4 && httpRequestL.status == 200){

			var objXML = httpRequestL.responseXML;
			var arrLMenu = objXML.getElementsByTagName("lMenu");
			
			for(var i=0;i<arrLMenu.length;i++){
			lMenuID = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
			lMenuName = arrLMenu[i].childNodes[1].childNodes[0].nodeValue;
			lMenuUrl = arrLMenu[i].childNodes[2].childNodes[0].nodeValue;
			
			strHTML += "<option value='"+lMenuID+"'>";
			strHTML += lMenuName;
			strHTML += "</option>";
			
			}
			
			
		}
		
		document.getElementById("lMenu").innerHTML = strHTML;
		
	}
</script>

</head>
<body>
	<div id="msg">
		<select id="hMenu" onchange="callLMenuXml()">
		</select>
		<select id="lMenu" onchange="">
		</select>
	</div>
	<input type="button" value="메뉴나와랏" onclick="callHMenuXml()"/>
</body>
</html>