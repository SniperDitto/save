<%@page import="Pkg.Client.Boards.BoardService"%>
<%@page import="Pkg.Client.Boards.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="Pkg.Client.Boards.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<% 
	
	//String userID = (String)session.getAttribute("userID");
	//vo.setUserID(userID);//세션에 있는 값이라 setProperty로 안됨
	
	
	
	//테스트용
	vo.setlMenuID("MENU01");
	vo.setUserID("ADMIN");
	
	System.out.println("-------------");
	System.out.println(vo.getIdx());
	System.out.println(vo.getTitle());
	System.out.println(vo.getContent());
	System.out.println(vo.getUserID());
	System.out.println(vo.getRegnum());
	System.out.println(vo.getLvl());
	System.out.println(vo.getCombine());
	System.out.println(vo.getVisited());
	System.out.println(vo.getRegdate());
	System.out.println(vo.getlMenuID());
	System.out.println(vo.getOrd());
	System.out.println(vo.getDelnum());
	System.out.println("-------------");
	
	BoardService bs = new BoardService();
	
	bs.insertBoard(vo);
	
	response.sendRedirect("./list.jsp");
%>