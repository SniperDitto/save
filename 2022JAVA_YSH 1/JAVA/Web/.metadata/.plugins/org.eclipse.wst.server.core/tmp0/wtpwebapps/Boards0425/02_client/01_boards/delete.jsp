<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	out.println("<font color='red'>글 삭제 완.</font>");
	
	//값 3개 받아서 db에 저장하기
	//1. 값 받기
	String[] delNums = request.getParameterValues("chk");
	
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
		
		for(int i=0;i<delNums.length;i++){
			sql = "DELETE FROM BOARDS WHERE IDX=?";
			ps = dbCon.prepareStatement(sql);
			
			ps.setString(1, delNums[i]);
			ps.executeUpdate();
			
		}

		ps.close();
		dbCon.close();
		//글 목록으로 이동
		response.sendRedirect("./list.jsp");
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>