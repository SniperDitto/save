<%@page import="Pkg.Board.Board"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	out.println("<font color='red'>글 수정 완.</font>");
	
	request.setCharacterEncoding("UTF-8");
	//1. 값 받기 + 인코딩 처리
	String strIDX = request.getParameter("idx");
	String strUserID = request.getParameter("userID");
	String strTitle = request.getParameter("title");
	String strContent = request.getParameter("content");
	
	//2. DB연결
	String id = "scores";
	String pw = "1";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	try{
		Connection dbCon = null;
		PreparedStatement ps = null;
		String sql = "";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		dbCon = DriverManager.getConnection(url,id,pw);
		
		//ID, REGNUM을 들고와야 한다
		sql = "UPDATE BOARDS SET TITLE=?, CONTENT=?, REGDATE=SYSDATE WHERE IDX=?";

		ps = dbCon.prepareStatement(sql);
		
		ps.setString(1, strTitle);
		ps.setString(2, strContent);
		ps.setString(3, strIDX);

		
		ps.executeUpdate();
		
		ps.close();
		dbCon.close();
		
		//글 목록으로 이동
		response.sendRedirect("./contents.jsp?idx="+strIDX);
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<% 	/*
	Board b = new Board();
	Hashtable<String, String> values= new Hashtable<String, String>();
	values.put("idx", strIDX);
	values.put("userid", strUserID);
	values.put("title", strTitle);
	values.put("content", strContent);
	
	b.boardUpdate(values);
	
	
	*/
%>