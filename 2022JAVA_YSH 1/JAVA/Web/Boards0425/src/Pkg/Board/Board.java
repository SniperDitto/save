package Pkg.Board;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;

import Pkg.DB.DBConn;

public class Board {
	
	private String idx;
	private String title;
	private String content;
	private String userID;
	private String regNum;
	private String regDate;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getRegNum() {
		return regNum;
	}
	public void setRegNum(String regNum) {
		this.regNum = regNum;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public void boardDelete(String idx) {
		//1. db연결
		DBConn.id = "scores";
		DBConn.pw = "1";
		DBConn.url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		String sql = "DELETE FROM BOARDS WHERE IDX=";
		ArrayList<String> params = new ArrayList<String>();
		params.add(idx);
		DBConn.insUpDel(sql, params, false);

	}
	
	public void boardUpdate(Hashtable<String, String> values) {
		String id = "scores";
		String pw = "1";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		Connection dbCon = null;
		CallableStatement cs = null;
		
		String sql = "";
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbCon = DriverManager.getConnection(url,id,pw);
			dbCon.setAutoCommit(false);
			
			//2. 삭제
			sql = "{call PKG_BOARDS.PROC_UP_BOARD(?,?,?,?)}";
			cs = dbCon.prepareCall(sql);
			for(int i=0;i<values.size();i++) {
				cs.setString(i+1, values.get("idx"));
				cs.setString(i+1, values.get("userid"));
				cs.setString(i+1, values.get("title"));
				cs.setString(i+1, values.get("content"));
			}
			cs.executeUpdate();
			

			
		}catch(Exception e) {
			e.printStackTrace();
			try {
				dbCon.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				//3. 저장하고 닫기
				dbCon.commit();
				cs.close();
				dbCon.close();
				cs=null;
				dbCon=null;
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
}
