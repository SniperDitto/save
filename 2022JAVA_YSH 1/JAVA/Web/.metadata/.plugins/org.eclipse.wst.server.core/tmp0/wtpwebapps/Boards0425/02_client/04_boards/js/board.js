/**
 * 
 */


var requests = [];

var Hmenu = function(MenuID, MenuName){
	this.MenuID = MenuID;
	this.MenuName = MenuName;
}

var getHMenuList = function(){
	//request 객체 생성
	requests[0] = new XMLHttpRequest();
	
	requests[0].onreadystatechange = setHMenuList;
	requests[0].open("post", "/Boards0425/02_client/04_boards/ajaxPages/getHmenus.jsp", true);
	requests[0].send();
	
}

var setHMenuList = function(){
	var strHTML = "";
	
	if(requests[0].readyState==4 && requests[0].status == 200){
		var objXML = requests[0].responseXML;
		
		var objHMenus = objXML.getElementsByTagName("Hmenu");
		var strMenuID = "";
		var strMenuName = "";
		for(var i=0;i<objHMenus.length;i++){
			strMenuID = objHMenus[i].childNodes[0].childNodes[0].nodeValue;
			strMenuName = objHMenus[i].childNodes[1].childNodes[0].nodeValue;
			strHTML += '<td width="120px" align="center" height="50px">';
			strHTML += '<a href="javascript:getLMenuList(\''+strMenuID+'\')">'+strMenuName+'</a>';
			strHTML += '</td>';
			
		}
	}
	document.getElementById("hMenus").innerHTML = strHTML;
}

var LMenu = function(lMenuID, lMenuName, lMenuURL, menuID){
	this.lMenuID = lMenuID;
	this.lMenuName = lMenuName;
	this.lMenuURL = lMenuURL;
	this.menuID = menuID;
}

var getLMenuList = function(hMenuID){
	requests[1] = new XMLHttpRequest();
	
	requests[1].onreadystatechange = setLMenuList;
	requests[1].open("post", "/Boards0425/02_client/04_boards/ajaxPages/getLMenus.jsp?hMenuID="+hMenuID, true);
	requests[1].send();
}

var setLMenuList = function(){
	var strHTML = "";
	
	if(requests[1].readyState==4 && requests[1].status == 200){
		var objXML = requests[1].responseXML;
		var objLMenus = objXML.getElementsByTagName("lMenu");
		var strLMenuID = "";
		var strLMenuName = "";
		var strLMenuUrl = "";
		var strHMenuID = "";
		for(var i=0;i<objLMenus.length;i++){
			strLMenuID = objLMenus[i].childNodes[0].childNodes[0].nodeValue;
			strLMenuName = objLMenus[i].childNodes[1].childNodes[0].nodeValue;
			strLMenuUrl = objLMenus[i].childNodes[2].childNodes[0].nodeValue;
			strHMenuID = objLMenus[i].childNodes[3].childNodes[0].nodeValue;
			strHTML += '<table width="200px" align="center" border="1" cellpadding="0" cellspacing="0" >';
				strHTML += '<tr>';
					strHTML += '<td width="200px" align="center" height="30px">';
						strHTML += '<a href="list.jsp?lMenuID='+strLMenuID+'&hMenuID='+strHMenuID+'">'+strLMenuName+'</a>';
					strHTML += '</td>';
				strHTML += '</tr>';
			strHTML += '</table>';
		}
		
	}
	document.getElementById("LMenus").innerHTML = strHTML;
}

var board = function(idx, regnum, ord, combine, lvl, delnum, title, visited, regdate, userID, lMenuID){
	this.idx = idx;
	this.regnum = regnum;
	this.ord = ord;
	this.combine = combine;
	this.lvl = lvl;
	this.delnum = delnum;
	this.title = title;
	this.visited = visited;
	this.regdate = regdate;
	this.userID = userID;
	this.lMenuID = lMenuID; 
}


var getBoardList = function(lMenuID){
	//request 객체 생성
	requests[2] = new XMLHttpRequest();
	
	requests[2].onreadystatechange = setBoardList;
	requests[2].open("post", "/Boards0425/02_client/04_boards/ajaxPages/getBoardList.jsp?lMenuID="+lMenuID, true);
	requests[2].send();
	
}

var setBoardList = function(){
	var strHTML = "";
	
	if(requests[2].readyState==4 && requests[2].status == 200){
		var objXML = requests[2].responseXML;
		var objBoards = objXML.getElementsByTagName("Board");
		
		var strIdx = "";
		var strTitle = "";
		var strUserID = "";
		var strRegdate = "";
		
		var regnum = "";
		var lvl = "";
		var combine = "";
		var ord = "";
		var delnum = "";
		
		var nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		
		strHTML += "<div class='boardHead'>";
		strHTML += "<span class='idx'>글번호</span>";
		strHTML += "<span class='title'>글제목</span>";
		strHTML += "<span class='userID'>작성자</span>";
		strHTML += "<span class='regdate'>작성일시</span>";
		strHTML += "</div>";
		strHTML += "<div class='boardBody'>";
		for(var i=0;i<objBoards.length;i++){
			strIdx = objBoards[i].childNodes[0].childNodes[0].nodeValue;
			strTitle = objBoards[i].childNodes[1].childNodes[0].nodeValue;
			strUserID = objBoards[i].childNodes[3].childNodes[0].nodeValue;
			strRegdate = objBoards[i].childNodes[8].childNodes[0].nodeValue;
			regnum = objBoards[i].childNodes[4].childNodes[0].nodeValue;
			lvl = objBoards[i].childNodes[5].childNodes[0].nodeValue;
			combine = objBoards[i].childNodes[6].childNodes[0].nodeValue;
			ord = objBoards[i].childNodes[10].childNodes[0].nodeValue;
			delnum = objBoards[i].childNodes[11].childNodes[0].nodeValue;
			
			var space = "";
			for(var j=0;j<lvl-1;j++){
				space += nbsp;
				if(j==lvl-2) space += "└";
			}
			
			strHTML += "<div class='row'>";
				strHTML += "<span class='idx'>"+strIdx+"</span>";
				strHTML += "<span class='title'>";
				if(delnum==1){
					strHTML += "<span style='color:red'>삭제된 글</span>";
				}else{
					strHTML += space;
					strHTML += "<a href=\"javascript:go_content("+strIdx+","+regnum+","+lvl+","+combine+","+ord+","+delnum+")\">"+strTitle+"</a>";
				}
				strHTML += "</span>";
				strHTML += "<span class='userID'>"+strUserID+"</span>";
				strHTML += "<span class='regdate'>"+strRegdate+"</span>";
			strHTML += "</div>";
		}
		strHTML += "</div>";
	}
	document.getElementById("boards").innerHTML = strHTML;
}

var checkID = function(){
	var userID = document.getElementById("userID").value;
	
	requests[3] = new XMLHttpRequest();
	
	requests[3].onreadystatechange = setCheckID;
	requests[3].open("post", "/Boards0425/02_client/04_boards/ajaxPages/checkID.jsp?userID="+userID, true);
	requests[3].send();
}

var setCheckID = function(){
	var strHTML = "";
	
	if(requests[3].readyState==4 && requests[3].status == 200){
		var objXML = requests[3].responseXML;
		var objResults = objXML.getElementsByTagName("checkID");
		var strResult = objResults[0].childNodes[0].childNodes[0].nodeValue;
		
		strHTML += "<span>";
		if(strResult=='false'){
			strHTML += "존재하지 않는 아이디";
		}else{
			
		}
		strHTML += "</span>";
	}
	document.getElementById("chkMsg").innerHTML = strHTML;
}

var userLogin = function(){
	var userID = document.getElementById("userID").value;
	var userPass = document.getElementById("userPass").value;
	
	requests[4] = new XMLHttpRequest();
	
	requests[4].onreadystatechange = setUserLogin;
	requests[4].open("post", "/Boards0425/02_client/04_boards/ajaxPages/login.jsp?userID="+userID+"&userPass="+userPass, true);
	requests[4].send();
}

var setUserLogin = function(){
	var strHTML = "";
	
	if(requests[4].readyState==4 && requests[4].status == 200){
		var objXML = requests[4].responseXML;
		var objResults = objXML.getElementsByTagName("Login");
		
		var strResult = objResults[0].childNodes[0].childNodes[0].nodeValue;
		
		strHTML += "<div id='chkMsg'>"+strResult+" 계정으로 로그인됨</div>";
		strHTML += "<input type='button' value='로그아웃' onclick='userLogout()'/>";
	}
	document.getElementById("login").innerHTML = strHTML;
}

var getHMenuSel = function(hMenuID){
	requests[5] = new XMLHttpRequest();
	
	requests[5].onreadystatechange = setHMenuSel;
	requests[5].open("get", "/Boards0425/02_client/04_boards/ajaxPages/getHmenus.jsp", true);
	requests[5].send();
	requests[5].selected = hMenuID;
}

var setHMenuSel = function(){
	var strHTML = "";
	
	if(requests[5].readyState==4 && requests[5].status == 200){
		var objXML = requests[5].responseXML;
		
		var objHMenus = objXML.getElementsByTagName("Hmenu");
		var strMenuID = "";
		var strMenuName = "";
		
		strHTML += "<select id='selectHMenu' onchange=\"hMenuSelChg(this)\">";
		for(var i=0;i<objHMenus.length;i++){
			strMenuID = objHMenus[i].childNodes[0].childNodes[0].nodeValue;
			strMenuName = objHMenus[i].childNodes[1].childNodes[0].nodeValue;
			strHTML += "<option value='"+strMenuID+"' ";
			if(requests[5].selected==strMenuID){
				strHTML += "selected='selected' ";
			}
			strHTML += ">";
			strHTML += strMenuName;
			strHTML += "</option>";
		}
		strHTML += "</select>";
	}
	document.getElementById("hMenuSel").innerHTML = strHTML;
}

var getLMenuSel = function(hMenuID, lMenuID){
	requests[6] = new XMLHttpRequest();
	
	requests[6].onreadystatechange = setLMenuSel;
	requests[6].open("get", "/Boards0425/02_client/04_boards/ajaxPages/getLMenus.jsp?hMenuID="+hMenuID, true);
	requests[6].send();
	requests[6].selected=lMenuID;
}

var setLMenuSel = function(){
	var strHTML = "";
	
	if(requests[6].readyState==4 && requests[6].status == 200){
		var objXML = requests[6].responseXML;
		
		var objLMenus = objXML.getElementsByTagName("lMenu");
		var strLMenuID = "";
		var strLMenuName = "";
		var strLMenuUrl = "";
		var strHMenuID = "";
		
		strHTML += "<select id='selectLMenu' onchange=\"lMenuSelChg(this)\">";
		for(var i=0;i<objLMenus.length;i++){
			strLMenuID = objLMenus[i].childNodes[0].childNodes[0].nodeValue;
			strLMenuName = objLMenus[i].childNodes[1].childNodes[0].nodeValue;
			strLMenuUrl = objLMenus[i].childNodes[2].childNodes[0].nodeValue;
			strHMenuID = objLMenus[i].childNodes[3].childNodes[0].nodeValue;
			
			strHTML += "<option value='"+strLMenuID+"' ";
			if(requests[6].selected==strLMenuID){
				strHTML += "selected=\"selected\" ";
			}
			strHTML += ">";
			strHTML += strLMenuName;
			strHTML += "</option>";
			
		}
		strHTML += "</select>";
	}
	document.getElementById("lMenuSel").innerHTML = strHTML;
}











