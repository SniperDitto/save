<%@page import="Pkg.Client.Boards.BoardService"%>
<%@page import="Pkg.Client.Boards.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

    
<%
String strXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";

BoardService bs = new BoardService();
ArrayList<BoardVO> boardList = bs.getBoardList("");

String idx = "";
String title = "";
String content = "";
String userID = "";
String regnum = "";
String lvl = "";
String combine = "";
String visited = "";
String regdate = "";
String lMenuID = "";
String ord = "";
String delnum = "";

strXML += "<Boards>";
for(BoardVO vo : boardList){
	
	idx = vo.getIdx();
	title = vo.getTitle();
	content = vo.getContent();
	userID = vo.getUserID();
	regnum = vo.getRegnum();
	lvl = vo.getLvl();
	combine = vo.getCombine();
	visited = vo.getVisited();
	regdate = vo.getRegdate();
	lMenuID = vo.getlMenuID();
	ord = vo.getOrd();
	delnum = vo.getDelnum();
	
	strXML += "<Board>";
		strXML += "<idx>"+idx+"</idx>";
		strXML += "<title>"+title+"</title>";
		strXML += "<content>"+content+"</content>";
		strXML += "<userID>"+userID+"</userID>";
		strXML += "<regnum>"+regnum+"</regnum>";
		strXML += "<lvl>"+lvl+"</lvl>";
		strXML += "<combine>"+combine+"</combine>";
		strXML += "<visited>"+visited+"</visited>";
		strXML += "<regdate>"+regdate+"</regdate>";
		strXML += "<lMenuID>"+lMenuID+"</lMenuID>";
		strXML += "<ord>"+ord+"</ord>";
		strXML += "<delnum>"+delnum+"</delnum>";
	strXML += "</Board>";
}
strXML += "</Boards>";

response.flushBuffer();
response.setContentType("text/xml");
out.println(strXML);

%>
    