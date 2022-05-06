<%@page import="Pkg.Client.Boards.BoardService"%>
<%@page import="Pkg.Client.Boards.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bs" class="Pkg.Client.Boards.BoardService"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
</head>
<body>
<%
	
	ArrayList<BoardVO> boardList = bs.getBoardList("");

%>
	<%
	String idx = "";
	String regnum = "";
	String lvl = "";
	String combine= "";
	String ord= "";
	String delnum= "";
	for(BoardVO vo : boardList){ %>
	<div>
		
		<% 
			idx = vo.getIdx();
			regnum = vo.getRegnum();
			lvl = vo.getLvl();
			combine = vo.getCombine();
			ord = vo.getOrd();
			delnum = vo.getDelnum();
			
			String tabStr = "";
			if(!ord.equals("1")){
				for(int i=0;i<Integer.parseInt(lvl)-1;i++){
					tabStr += "&nbsp;";
				}
				tabStr += "└";
			}
			
		%>
		<span><%=tabStr%></span>
		<a href="./content.jsp?idx=<%=idx %>&regnum=<%=regnum %>&lvl=<%=lvl %>&combine=<%=combine %>&ord=<%=ord %>&delnum=<%=delnum %>"><%=vo.getTitle() %></a>
	</div>
	<%} %>
	<a href="./write.jsp">글쓰기</a>
</body>
</html>