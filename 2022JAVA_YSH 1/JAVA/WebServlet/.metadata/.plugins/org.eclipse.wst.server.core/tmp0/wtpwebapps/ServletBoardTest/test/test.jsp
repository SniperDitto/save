<%@page import="java.util.Hashtable"%>
<%@page import="pkg.test.testVO"%>
<%@page import="java.util.ArrayList"%>
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
<title>web page 제작에 대한 고찰</title>
</head>
<body>
<%
	ArrayList<testVO> arrA = (ArrayList<testVO>)request.getAttribute("listA");
	ArrayList<testVO> arrB = (ArrayList<testVO>)request.getAttribute("listB");
	ArrayList<testVO> arrC = (ArrayList<testVO>)request.getAttribute("listC");
	ArrayList<testVO> arrD = (ArrayList<testVO>)request.getAttribute("listD");
	
	
%>
<script type="text/javascript">
	var gbn2_A = 1;var gbn2_B = 1;var gbn2_C = 1;var gbn2_D = 1;
	const maxMap = new Map();

	$(document).ready(function(){
		$("#nextA").click(function(){
			funcNext(1, "A", gbn2_A);
		});
		$("#nextB").click(function(){
			funcNext(1, "B", gbn2_B);
		});
		$("#nextC").click(function(){
			funcNext(1, "C", gbn2_C);
		});
		$("#nextD").click(function(){
			funcNext(1, "D", gbn2_D);
		});
		
		$("#prevA").click(function(){
			funcNext(0, "A", gbn2_A);
		});
		$("#prevB").click(function(){
			funcNext(0, "B", gbn2_B);
		});
		$("#prevC").click(function(){
			funcNext(0, "C", gbn2_C);
		});
		$("#prevD").click(function(){
			funcNext(0, "D", gbn2_D);
		});
		
	});
	
	var funcNext = function(prevOrNext, category, gbn){
		var maxG = maxMap.get(category);
		//수정필요
		
		prevOrNext==1? gbn++ : gbn-- ;
		
		if(gbn>maxG){
			gbn=1;
		}else if(gbn<1){
			gbn=maxG;
		}
		
		if(category=="A"){
			gbn2_A = gbn;
		} else if(category=="B"){
			gbn2_B = gbn;
		} else if(category=="C"){
			gbn2_C = gbn;
		} else if(category=="D"){
			gbn2_D = gbn;
		}
		
		$.ajax({
			datatype : "json",
			data : {
				strURL : category,
				gbn2 : gbn
			},
			type : "get",
			url : "test.do",
			async : true,
			success : function(obj){
				maxMap.set(category,this.MAXGBN2);
				var strHTML = '<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">';
				$(obj).each(function(){
					strHTML += '<tr>';
					strHTML += '<td width="100px" align="center" height="30">';
						strHTML += this.FID;
					strHTML += '</td>';
					strHTML += '<td width="250px" align="center" height="30">';
						strHTML += this.FNAME;
					strHTML += '</td>';
					strHTML += '</tr>';
				})
				strHTML += '</table>';
				
				$("#table"+category).html(strHTML);
				
			},
			fail : function(){
				alert("쉴패~~~!!~!");
			}
		});
	}
	
	
</script>
<table border="1" cellpadding="0" cellspacing="0" width="700px" align="center">
	<tr>
		<td width="700px" height="30px" align="right" colspan="2">
		</td>
	</tr>
</table>
<table border="1" cellpadding="0" cellspacing="0" width="700px" align="center">
	<tr>
		<td width="350px" height="300px" align="center" valign="top">
			<div>
			<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
				<tr>
					<td width="350px" height="30px" align="center">
						<input type="button" id="prevA" name="btn" value="←"/>
						<input type="button" id="nextA" name="btn" value="→"/>
					</td>
				</tr>
			</table>
			</div>
			<div id="tableA">
				<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
				<% for(testVO vo : arrA){ %>
					<tr>
						<td width="100px" align="center" height="30">
							<%=vo.getfID() %>
						</td>
						<td width="250px" align="center" height="30">
							<%=vo.getfName() %>
						</td>
					</tr>
				<% } %>
				</table>
			</div>
		</td>
		<td width="350px" height="300px" align="center" valign="top">
			<div>
			<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
				<tr>
					<td width="350px" height="30px" align="center">
						<input type="button" id="prevB" name="btn" value="←"/>
						<input type="button" id="nextB" name="btn" value="→"/>
					</td>
				</tr>
			</table>
			</div>
			<div id="tableB">
				<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
				<% for(testVO vo : arrB){ %>
					<tr>
						<td width="100px" align="center" height="30">
							<%=vo.getfID() %>
						</td>
						<td width="250px" align="center" height="30">
							<%=vo.getfName() %>
						</td>
					</tr>
				<% } %>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td width="350px" height="300px" align="center" valign="top">
			<div>
			<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
				<tr>
					<td width="350px" height="30px" align="center">
						<input type="button" id="prevC" name="btn" value="←"/>
						<input type="button" id="nextC" name="btn" value="→"/>
					</td>
				</tr>
			</table>
			</div>
			<div id="tableC">
				<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
				<% for(testVO vo : arrC){ %>
					<tr>
						<td width="100px" align="center" height="30">
							<%=vo.getfID() %>
						</td>
						<td width="250px" align="center" height="30">
							<%=vo.getfName() %>
						</td>
					</tr>
				<% } %>
				</table>
			</div>
		</td>
		<td width="350px" height="300px" align="center" valign="top">
			<div>
			<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
				<tr>
					<td width="350px" height="30px" align="center">
						<input type="button" id="prevD" name="btn" value="←"/>
						<input type="button" id="nextD" name="btn" value="→"/>
					</td>
				</tr>
			</table>
			</div>
			<div id="tableD">
				<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
				<% for(testVO vo : arrD){ %>
					<tr>
						<td width="100px" align="center" height="30">
							<%=vo.getfID() %>
						</td>
						<td width="250px" align="center" height="30">
							<%=vo.getfName() %>
						</td>
					</tr>
				<% } %>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
</html>