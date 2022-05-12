<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Pkg.Member.MemberVO"></jsp:useBean>
<jsp:useBean id="ms" class="Pkg.Client.Members.MemberService"></jsp:useBean>
<jsp:setProperty property="userID" name="user"/>
<jsp:setProperty property="userPass" name="user"/>

<%

	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String userPass = request.getParameter("userPass");
	
	String loginUser = ms.login(userID, userPass);
	
	if(!loginUser.equals("FAIL")){
		session.setAttribute("userID", loginUser);
	}
	
	response.sendRedirect("./list.jsp");
	
	
%>
