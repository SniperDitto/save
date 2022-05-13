<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bs" class="Pkg.Client.Boards.BoardService"></jsp:useBean>
<jsp:useBean id="vo" class="Pkg.Client.Boards.BoardVO"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>
<%
String idx = request.getParameter("idx");
String hMenuID = request.getParameter("hMenuID");
String lMenuID = request.getParameter("lMenuID");
String combine = request.getParameter("combine");
out.println(vo.toString());
bs.deleteBoard(vo);
response.sendRedirect("./list.jsp?hMenuID="+hMenuID+"&lMenuID="+vo.getlMenuID());
%>