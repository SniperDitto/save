<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bs" class="Pkg.Client.Boards.BoardService"></jsp:useBean>
<jsp:useBean id="vo" class="Pkg.Client.Boards.BoardVO"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>
<%
request.setCharacterEncoding("UTF-8");
String hMenuID = request.getParameter("hMenuID");
String loginID = (String)session.getAttribute("userID");
vo.setUserID(loginID);
if(loginID==null){
	response.sendRedirect("./list.jsp");
}

bs.insertBoard(vo);

response.sendRedirect("./list.jsp?hMenuID="+hMenuID+"&lMenuID="+vo.getlMenuID());

%>