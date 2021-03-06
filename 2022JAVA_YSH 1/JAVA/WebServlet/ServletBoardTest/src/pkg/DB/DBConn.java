package pkg.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBConn {
	private static String id = "scores";
	private static String pw = "1";
	private static String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	public static Connection getConnection() {
		Connection dbConn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbConn = DriverManager.getConnection(url, id, pw);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dbConn;
	}
	
	public static PreparedStatement getPS(Connection conn, String sql, ArrayList<String> params) {
		PreparedStatement ps = null;
		
		try {
			ps = conn.prepareStatement(sql);
			for(int i=0;i<params.size();i++) {
				ps.setString(i+1, params.get(i));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ps;
	}
	
	public static CallableStatement getCS(Connection conn, String sql, ArrayList<String> params) {
		CallableStatement cs = null;
		
		try {
			cs = conn.prepareCall(sql);
			for(int i=0;i<params.size();i++) {
				cs.setString(i+1, params.get(i));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cs;
	}
	
	
	
}
