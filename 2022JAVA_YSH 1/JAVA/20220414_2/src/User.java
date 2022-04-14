import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class User {
	private String dbID;
	private String dbPW;
	private String dbURL;
	
	public User(String dbID, String dbPW, String dbURL) {
		this.dbID = dbID;
		this.dbPW = dbPW;
		this.dbURL = dbURL;
		//driver loading
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	public int userInsert(String inName) {
		int inCNT = 0;
		
		Connection conn = null;
		try {
			conn=DriverManager.getConnection(this.dbURL, this.dbID, this.dbPW);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql = "{call PKG_USERS.PROC_INS_USERS(?)}";
		
		try {
			CallableStatement csmt = conn.prepareCall(sql);
			csmt.setNString(1, inName);
			inCNT = csmt.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			System.out.println("끗.");
		}
		
		return inCNT;
	}
	
	public int userUpdate(String upID, String upName) {
		int upCNT = 0;
		
		Connection conn = null;
		try {
			conn=DriverManager.getConnection(this.dbURL, this.dbID, this.dbPW);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql = "{call PKG_USERS.PROC_UP_USERS(?,?)}";
		
		try {
			CallableStatement csmt = conn.prepareCall(sql);
			csmt.setNString(1, upID);
			csmt.setNString(2, upName);
			upCNT = csmt.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			System.out.println("끗.");
		}
		
		return upCNT;
	}
	
	public int userDelete(String delID) {
		int delCNT=0;
		//1. Connection 객체 생성
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(this.dbURL, this.dbID, this.dbPW);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//2. sql 생성
		String sql = "{call PKG_USERS.PROC_DEL_USERS(?)}";
		
		//3. sql을 담을 객체 생성
		try {
			CallableStatement csmt = conn.prepareCall(sql);
			csmt.setNString(1, delID);
			//4. sql문 날리기
			delCNT = csmt.executeUpdate();
			conn.close();
			System.out.println("변경된 값 : "+Integer.toString(delCNT));
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			System.out.println("끗.");
		}
		
		
		return delCNT;
	}
	
}
