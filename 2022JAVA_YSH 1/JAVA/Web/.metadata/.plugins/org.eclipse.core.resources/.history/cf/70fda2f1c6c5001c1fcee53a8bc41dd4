<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	out.println("<font color='red'>글 작성 완.</font>");
	
	//값 3개 받아서 db에 저장하기
	request.setCharacterEncoding("UTF-8");
	//1. 값 받기 + 인코딩 처리
	String strUserID = request.getParameter("userID");
	String strTitle = request.getParameter("title");
	String strContent = request.getParameter("content");
	out.println(strUserID);
	out.println(strTitle);
	out.println(strContent);
	
	//2. DB연결
	String id = "scores";
	String pw = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	try{
		Connection dbCon = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		dbCon = DriverManager.getConnection(url,id,pw);
		
		//ID, REGNUM을 들고와야 한다
		sql = "SELECT TO_NUMBER(NVL(MAX(IDX),0))+1 AS IDX FROM BOARDS";
		ps = dbCon.prepareStatement(sql);
		rs = ps.executeQuery();
		
		rs.next();
		
		String strIDX = rs.getString("IDX");
		
		
		sql = "INSERT INTO BOARDS(IDX, TITLE, CONTENT, USERID, REGNUM, REGDATE) VALUES(?,?,?,?,?,SYSDATE)";
		ps = dbCon.prepareStatement(sql);
		
		ps.setString(1, strIDX);
		ps.setString(2, strTitle);
		ps.setString(3, strContent);
		ps.setString(4, strUserID);
		ps.setString(5, "1");
		
		ps.executeUpdate();
		
		rs.close();
		ps.close();
		dbCon.close();
		
		//글 목록으로 이동
		response.sendRedirect("./list.jsp");
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>