<%@page import="Pkg.Client.Menus.MenuService"%>
<%@page import="Pkg.Client.Menus.LmenuVO"%>
<%@page import="Pkg.Client.Menus.HmenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
	String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	
	MenuService ms = new MenuService();
	ArrayList<HmenuVO> hMenuList = ms.getHmenus();
	
	xml += "<Hmenus>";
	for(HmenuVO hvo : hMenuList){
		xml += "<Hmenu>";
			xml += "<HmenuID>"+hvo.getMenuID()+"</HmenuID>";
			xml += "<HmenuName>"+hvo.getMenuName()+"</HmenuName>";
		xml += "</Hmenu>";
	}
	xml += "</Hmenus>";
	
	response.flushBuffer();
	response.setContentType("text/xml");
	out.println(xml);
%>