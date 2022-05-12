<%@page import="Pkg.Client.Members.MemberService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
	
<%

String userID = request.getParameter("userID");
MemberService ms = new MemberService();
boolean isDuplicated = ms.checkID(userID); 

String strXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";

strXML += "<checkID>";
	strXML += "<result>"+isDuplicated+"</result>";
strXML += "</checkID>";

response.flushBuffer();
response.setContentType("text/xml");
out.println(strXML);
%>	
	