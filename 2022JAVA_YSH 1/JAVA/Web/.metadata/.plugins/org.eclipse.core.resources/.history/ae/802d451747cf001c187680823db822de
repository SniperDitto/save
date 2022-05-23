<%@page import="Pkg.Client.Menus.MenuService"%>
<%@page import="Pkg.Client.Members.LmenuVO"%>
<%@page import="Pkg.Client.Members.HmenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%

	String strXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	/*
	strXML += "<hMenus>";
		strXML += "<hMenu>";
			strXML += "<menuID>MENU01</menuID>";
			strXML += "<menuName>공지사항</menuName>";
		strXML += "</hMenu>";
		
		strXML += "<hMenu>";
			strXML += "<menuID>MENU02</menuID>";
			strXML += "<menuName>공부</menuName>";
		strXML += "</hMenu>";
		
		strXML += "<hMenu>";
			strXML += "<menuID>MENU03</menuID>";
			strXML += "<menuName>운동</menuName>";
		strXML += "</hMenu>";
		
		strXML += "<hMenu>";
			strXML += "<menuID>MENU04</menuID>";
			strXML += "<menuName>코딩</menuName>";
		strXML += "</hMenu>";
	
		strXML += "<hMenu>";
			strXML += "<menuID>MENU05</menuID>";
			strXML += "<menuName>자유게시판</menuName>";
		strXML += "</hMenu>";
	strXML += "</hMenus>";
	*/
	
	MenuService ms = new MenuService();
	ArrayList<HmenuVO> hMenus = ms.getHmenus();
	
	String menuID = "";
	String menuName = "";
	
	strXML += "<hMenus>";
	for(HmenuVO hvo : hMenus){
		menuID = hvo.getMenuID();
		menuName = hvo.getMenuName();
		
		strXML += "<hMenu>";
		strXML += "<menuID>"+menuID+"</menuID>";
		strXML += "<menuName>"+menuName+"</menuName>";
		strXML += "</hMenu>";
	}
	strXML += "</hMenus>";
	
	response.flushBuffer();
	response.setContentType("text/xml");
	out.println(strXML);
%>