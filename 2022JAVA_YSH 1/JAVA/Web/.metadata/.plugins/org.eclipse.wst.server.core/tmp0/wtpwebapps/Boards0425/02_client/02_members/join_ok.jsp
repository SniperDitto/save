<%@page import="java.util.ArrayList"%>
<%@page import="Pkg.Member.MemberService"%>
<%@page import="Pkg.Member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="member" class="Pkg.Member.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

<% 
	out.println(member.getUserID());
	out.println(member.getUserPass());
	out.println(member.getUserName());
	out.println(member.getUserGen());
	
	String strHobbies="";
	for(String s : member.getUserHobby()){
		strHobbies += s + " ";
	}
	out.println(strHobbies);
	
	MemberService mService = new MemberService();
	boolean isOK = mService.joinMember(member);
	if(isOK){
		response.sendRedirect("가입완료페이지");
	}else{
		response.sendRedirect("./join.jsp?join=f");
	}
	
	
	/* 
		A
		<jsp:useBean id="member" class="Pkg.Member.MemberVO"></jsp:useBean>
		<jsp:setProperty property="*" name="member"/>
	*/
	/*	A와 B는 같은 의미
		B 
	String userID = request.getParameter("userID");//name으로 값 받기
	String userPass = request.getParameter("userPass");
	String userName = request.getParameter("userName");
	
	MemberVO member = new MemberVO(); 
	member.setUserID(userID);
	member.setUserPass(userPass);
	member.setUserName(userName);
	*/
	
	/* 
	MemberService mService = new MemberService();
	boolean isIdDuplicate = mService.memberJoin(member);
	if(isIdDuplicate){
		out.println("중복된 id");
	}
	else{
		out.println("사용가능한 id");
	}
	*/
	
	
	
	
%>