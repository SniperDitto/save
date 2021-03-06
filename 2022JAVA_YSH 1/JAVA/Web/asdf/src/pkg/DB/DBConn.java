package pkg.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

public class DBConn {
	
	public static String user = "score";
	public static String password = "1";
	public static String url= "jdbc:oracle:thin:@localhost:1521:XE";
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static PreparedStatement getPS(String sql, ArrayList<String> params) {;
		PreparedStatement ps = null;
		Connection conn = null;
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			
			for(int i=0;i<params.size();i++) {
				ps.setString(i+1, params.get(i));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ps;
	}
	
	
	public static CallableStatement getCS(String sql, ArrayList<String> params) {
		CallableStatement cs = null;
		Connection conn = null;
		
		try {
			conn = getConnection();
			cs = conn.prepareCall(sql);
			
			for(int i=0;i<params.size();i++) {
				cs.setString(i+1, params.get(i));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cs;
	}
	
	
	public static void insUpDel(String sql, ArrayList<String> params, boolean isProc) {
		
		try {
			
			if(isProc) {
				PreparedStatement ps = getPS(sql, params);
				ps.executeUpdate();
			}else {
				CallableStatement cs = getCS(sql, params);
				cs.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public static ResultSet select(String sql, ArrayList<String> params, boolean isProc) {
		ResultSet rs = null;
		try {
			
			if(!isProc) {
				PreparedStatement ps = getPS(sql, params);
				rs = ps.executeQuery();
			}else {
				CallableStatement cs = getCS(sql, params);
				cs.registerOutParameter(params.size()+1, OracleTypes.CURSOR);
				cs.executeQuery();
				rs = (ResultSet) cs.getObject(params.size()+1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
}
