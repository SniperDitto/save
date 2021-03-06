package pkg.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class OracleDBConn implements DBConn{
	
	private String id = "scores";
	private String pw = "1";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public PreparedStatement getPreparedStatement(Connection conn, String sql, ArrayList<String> params) {
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = conn.prepareStatement(sql);
			for(int i=0;i<params.size();i++) {
				preparedStatement.setString(i+1, params.get(i));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return preparedStatement;
	}
	
	public CallableStatement getCallableStatement(Connection conn, String sql, ArrayList<String> params) {
		CallableStatement callableStatement = null;
		
		try {
			callableStatement = conn.prepareCall(sql);
			for(int i=0;i<params.size();i++) {
				callableStatement.setString(i+1, params.get(i));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return callableStatement;
	}
	
	
}
