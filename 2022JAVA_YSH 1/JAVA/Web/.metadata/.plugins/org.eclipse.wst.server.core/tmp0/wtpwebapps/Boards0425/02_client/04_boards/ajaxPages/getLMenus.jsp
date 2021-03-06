<%@page import="Pkg.Client.Menus.MenuService"%>
<%@page import="Pkg.Client.Menus.LmenuVO"%>
<%@page import="Pkg.Client.Menus.HmenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%

	String strXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	
	String hMenuID = request.getParameter("hMenuID");
	MenuService ms = new MenuService();
	ArrayList<LmenuVO> lMenus = ms.getLmenus(hMenuID);
	
	strXML += "<lMenus>";
	for(LmenuVO lvo : lMenus){
		strXML += "<lMenu>";
			strXML += "<lMenuID>"+lvo.getlMenuID()+"</lMenuID>";
			strXML += "<lMenuName>"+lvo.getlMenuName()+"</lMenuName>";
			strXML += "<lMenuUrl>"+lvo.getlMenuURL()+"</lMenuUrl>";
			strXML += "<hMenuID>"+lvo.getMenuID()+"</hMenuID>";
		strXML += "</lMenu>";
	}
	strXML += "</lMenus>";
	
	response.flushBuffer();
	response.setContentType("text/xml");
	out.println(strXML);
%>