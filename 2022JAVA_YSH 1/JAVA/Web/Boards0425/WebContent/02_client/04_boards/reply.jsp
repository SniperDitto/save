<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bs" class="Pkg.Client.Boards.BoardService"></jsp:useBean>
<jsp:useBean id="rvo" class="Pkg.Client.Boards.ReplyVO"></jsp:useBean>
<jsp:useBean id="vo" class="Pkg.Client.Boards.BoardVO"></jsp:useBean>
<jsp:setProperty name="rvo" property="*"/>
<jsp:setProperty name="vo" property="*"/>
<%
String loginID = (String)session.getAttribute("userID");
rvo.setUserID(loginID);

String hMenuID = request.getParameter("hMenuID");

bs.insertReply(rvo);
response.sendRedirect("./content.jsp?hMenuID="+hMenuID+"&lMenuID="+vo.getlMenuID());
%>