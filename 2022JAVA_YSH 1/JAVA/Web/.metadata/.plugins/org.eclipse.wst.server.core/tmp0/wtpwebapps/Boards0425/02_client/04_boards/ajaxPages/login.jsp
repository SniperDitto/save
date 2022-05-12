<%@page import="Pkg.Client.Members.MemberService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<jsp:useBean id="ms" class="Pkg.Client.Members.MemberService"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
String userID = request.getParameter("userID");
String userPass = request.getParameter("userPass");

String loginUser = ms.login(userID, userPass);

if(!loginUser.equals("FAIL")){
	session.setAttribute("userID", loginUser);
}

String strXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";

strXML += "<Login>";
	strXML += "<userID>"+loginUser+"</userID>";
strXML += "</Login>";

response.flushBuffer();
response.setContentType("text/xml");
out.println(strXML);
%>	