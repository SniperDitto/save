<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new menu(ajax)</title>
<script>
	var httpRequest;
	var getHttpRequest=function(){
		httpRequest = new XMLHttpRequest();
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
		httpRequest.onreadystatechange = setHMenus;
		//get or post, 데이터 파일 경로, 동기인지(비동기인지)
		httpRequest.open("post","./ajaxPages/getHmenus.jsp",true);
		httpRequest.send();
	}
	
	var callLMenuXml = function(){
		getHttpRequest();
		
		//통신이 완료되면 실행할 메서드
		httpRequest.onreadystatechange = setLMenus;
		//get or post, 데이터 파일 경로, 동기인지(비동기인지)
		httpRequest.open("post","./ajaxPages/getLmenus.jsp",true);
		httpRequest.send();
	}
	
	var setHMenus=function(){
		var strHTML = "";
		var hMenuID = "";
		var hMenuName = "";
		//통신이 성공했는지 여부
		if (httpRequest.readyState==4 && httpRequest.status == 200){
			var objXML = httpRequest.responseXML;
			var arrHMenu = objXML.getElementsByTagName("hMenu");
			
			for(var i=0;i<arrHMenu.length;i++){
				hMenuID = arrHMenu[i].childNodes[0].childNodes[0].nodeValue;
				hMenuName = arrHMenu[i].childNodes[0].childNodes[0].nodeValue;
				
				strHTML += "<option value='"+hMenuID+"'>";
				strHTML += hMenuName;
				strHTML += "</option>";
			}
			
		}
		//else{alert("쉴패~~!~!~");}
		
		document.getElementById("hMenu").innerHTML = strHTML;
		//callLMenuXml();
	}
	
	var setLMenus = function(obj){
		var strHTML = "";
		var lMenuID = "";
		var lMenuName = "";
		//통신이 성공했는지 여부
		if (httpRequest.readyState==4 && httpRequest.status == 200){
			var objXML = httpRequest.responseXML;
			var arrLMenu = objXML.getElementsByTagName("lMenu");
			
			if(obj.value=="MENU01"){
				for(var i=0;i<2;i++){
					lMenuID = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					lMenuName = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					
					strHTML += "<option value='"+lMenuID+"'>";
					strHTML += lMenuName;
					strHTML += "</option>";
				}
			}else if(obj.value=="MENU02"){
				for(var i=2;i<5;i++){
					lMenuID = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					lMenuName = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					
					strHTML += "<option value='"+lMenuID+"'>";
					strHTML += lMenuName;
					strHTML += "</option>";
				}
			}else if(obj.value=="MENU03"){
				for(var i=5;i<8;i++){
					lMenuID = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					lMenuName = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					
					strHTML += "<option value='"+lMenuID+"'>";
					strHTML += lMenuName;
					strHTML += "</option>";
				}
			}else if(obj.value=="MENU04"){
				for(var i=8;i<12;i++){
					lMenuID = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					lMenuName = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					
					strHTML += "<option value='"+lMenuID+"'>";
					strHTML += lMenuName;
					strHTML += "</option>";
				}
			}else if(obj.value=="MENU05"){
				for(var i=12;i<13;i++){
					lMenuID = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					lMenuName = arrLMenu[i].childNodes[0].childNodes[0].nodeValue;
					
					strHTML += "<option value='"+lMenuID+"'>";
					strHTML += lMenuName;
					strHTML += "</option>";
				}
			}
		}
		//else{alert("쉴패~~!~!~");}
		
		document.getElementById("lMenu").innerHTML = strHTML;
	}
</script>

</head>
<body>
	<div id="msg">
		<select id="hMenu" onchange="setLMenus(this)">
		</select>
		<select id="lMenu" onchange="">
		</select>
	</div>
	<input type="button" value="메뉴나와랏" onclick="callHMenuXml()"/>
</body>
</html>