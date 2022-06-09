package pkg.boards.commons.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class DBConn {
	
	private static String dbID = "auth";
	private static String dbPass  = "1";
	private static String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	
	public static Connection getConnection() {
		
		Connection dbCon = null;
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbCon = DriverManager.getConnection(dbUrl, dbID, dbPass);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return dbCon;
		
	}
	
	public static PreparedStatement getPreparedStatement(Connection dbCon, String strSql, ArrayList<String> params) {
		
		PreparedStatement psmt = null;
		
		try {
			
			psmt = dbCon.prepareStatement(strSql);
			
			int i = 1;
			for(String value : params) {
				psmt.setString(i, value);
				i += 1;
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return psmt;
		
	}
	
	public static CallableStatement getCallableStatement(Connection dbCon, String strSql, ArrayList<String> params) {
		
		CallableStatement csmt = null;
		
		try {
			csmt = dbCon.prepareCall(strSql);
			
			int i = 1;
			for(String value : params) {
				csmt.setString(i, value);
				i += 1;
			}
	
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return csmt;
		
	}
	
	
}

