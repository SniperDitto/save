<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="Pkg.Member.MemberVO"></jsp:useBean>
<jsp:useBean id="ms" class="Pkg.Client.Members.MemberService"></jsp:useBean>
<jsp:setProperty property="userID" name="user"/>
<jsp:setProperty property="userPass" name="user"/>

<%

	//id, pw 체크 - db연결해 select
	boolean isLogin =  ms.chkLogin(user.getUserID(), user.getUserPass());
	
	System.out.println("로그인여부 - "+isLogin);
	if(isLogin){
		//Session 처리
		//로그인 성공시 세션 발급
		//servlet, spring
		//HttpSession s = request.getSession();
		//s.setAttribute("userID", user.getUserID());
		
		//jsp(session 객체 제공)
		session.setAttribute("userID", user.getUserID());
	}
	
	response.sendRedirect("../../index.jsp");
	
	
%>
