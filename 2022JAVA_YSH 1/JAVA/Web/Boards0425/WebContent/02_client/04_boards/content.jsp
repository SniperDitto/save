<%@page import="java.util.ArrayList"%>
<%@page import="Pkg.Client.Boards.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bs" class="Pkg.Client.Boards.BoardService"></jsp:useBean>
<jsp:useBean id="vo" class="Pkg.Client.Boards.BoardVO"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>
<!DOCTYPE html>
<html>
<head>
<%
	String loginID = (String)session.getAttribute("userID");
	
	if(loginID==null){
		response.sendRedirect("./list.jsp");
	}
	
	String hMenuID = request.getParameter("hMenuID");
	String lMenuID = vo.getlMenuID();
	out.println(vo.toString() + " hmenuid=" + hMenuID);
	
	
	String writeID = "";
	ArrayList<BoardVO> list = bs.getBoardList(vo.getIdx(), lMenuID);
	for(BoardVO b : list){
		writeID = b.getUserID();
	}
%>
<meta charset="UTF-8">
<title>글내용</title>
<script>
var goWrite = function(){
	document.getElementById("hiddenForm").submit();
}
var goDel = function(){
	//if(loginID==삭제하려는 글 작성자 || loginID=="ADMIN"){
		location.href="./delete.jsp?idx=<%=vo.getIdx()%>&hMenuID=<%=hMenuID%>&lMenuID=<%=lMenuID%>&combine=<%=vo.getCombine()%>";
	//}
	//else{
	//	alert('자신의 글만 삭제 가능합니다');
	//}
}
var replyInsert(){
	//내용 없으면 입력 경고창(trim)
	//hMenu 넘겨주기
}
</script>
</head>
<body>
<form name="hiddenForm" action="./write.jsp" method="post" id="hiddenForm">
	<input type="hidden" name="idx" id="idx"/>
	<input type="hidden" name="regnum" id="regnum"/>
	<input type="hidden" name="lvl" id="lvl"/>
	<input type="hidden" name="combine" id="combine"/>
	<input type="hidden" name="ord" id="ord"/>
	<input type="hidden" name="delnum" id="delnum"/>
	<input type="hidden" name="hMenuID" value="<%=hMenuID %>"/>
	<input type="hidden" name="lMenuID" value="<%=lMenuID %>"/>
</form>
<div>
	<table cellcpacing="0" cellpadding="0" width="700px" border="1px" align="center">
		<tr>
			<td width="700px" height="30px">
				<!-- 댓글내용 -->
			</td>
		</tr>
		<tr>
			<td width="700px" height="50px" align="center">
				<form action="">
				<textarea name="reply" id="reply" style='width:600px;height:50px'></textarea>
				<input type="button" onclick="javascript:replyInsert()" value="확인" style='width:50px;height:50px'/>
				</form>
			</td>
		</tr>
	</table>
</div>
<div>
<a href="./write.jsp?idx=0">새글쓰기</a>
<a href="javascript:goWrite()">답글달기</a>
<%if(loginID.equals(writeID)){ %>
<a href="javascript:goDel()">글 삭제</a>
<%} %>
<a href="./list.jsp?hMenuID=<%=hMenuID %>">목록</a>
</div>
</body>
</html>