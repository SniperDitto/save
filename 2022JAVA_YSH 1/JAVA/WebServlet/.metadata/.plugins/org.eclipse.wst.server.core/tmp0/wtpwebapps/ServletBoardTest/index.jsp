<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$("#btnList").click(function(){
			$.ajax({
				dataType : "xml",
				url : "stock.do?jspURL=ajaxXML",
				success : function(XML){
					var strHTML = "<div>";
					var sID= "";var sName= "";var sInfo = "";
					var XMLs = XML.getElementsByTagName("stock");
					for(var i=0;i<XMLs.length;i++){
						sID = XMLs[i].childNodes[0].childNodes[0].nodeValue;
						sName = XMLs[i].childNodes[1].childNodes[0].nodeValue;
						sInfo = XMLs[i].childNodes[2].childNodes[0].nodeValue;
						
						strHTML += "<div> ID : "+sID+"</div>";
						strHTML += "<div> 종목명 : "+sName+"</div>";
						strHTML += "<div> 회사정보 : "+sInfo+"</div>";
					}
					strHTML += "</div>";
					
					$("#msgXML").html(strHTML);
					
				},
				fail : function(){
					alert("쉴패~~~!!~!");
				}
			});
		});//$("#btnList").click()
		
		
		$("#btnList2").click(function(){
			$.ajax({
				dataType : "json",
				data : {
					jspURL : "ajaxJSON",
					userID : "userID"
				},
				type : "get",
				url : "stock.do",
				async : true,
				success : function(obj){
					var strHTML = "<div>";
					$(obj).each(function(){
						strHTML += "<div>ID : "+this.sid+"</div>";
						strHTML += "<div>이름 : "+this.sname+"</div>";
						strHTML += "<div>회사설명 : "+this.sinfo+"</div>";
					});
					strHTML += "</div>";
					
					$("#msgJSON").html(strHTML);
					
				},
				fail : function(){
					alert("쉴패~~~!!~!");
				}
			});
		});//$("#btnList2").click()
		
		
	});
</script>
</head>
<body>
	<a href="test.do">test</a>
	<a href="stock.do?jspURL=list">주식목록</a>
	<a href="stock.do?jspURL=write">주식추가</a>
	<a href="stock.do?jspURL=ajaxXML">XML</a>
	<a href="stock.do?jspURL=ajaxJSON">JSON</a>
<div>
	<input type="button" value="XML" id="btnList"/>
	<div id="msgXML"></div>
</div>
<div>
	<input type="button" value="JSON" id="btnList2"/>
	<div id="msgJSON"></div>
</div>
<div id="msg"></div>
</body>
</html>