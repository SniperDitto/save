package Pkg.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import oracle.jdbc.OracleTypes;

public class DBConn {
	
	//1. procedure(callablestatement) / inline query(preparedstatement)
	
	//2. select(cursor,resultset) / 그 외
	
	public static String id = "scores";
	public static String pw = "1";
	public static String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,id,pw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
	
	public static PreparedStatement getPreparedStatement(String sql, ArrayList<String> params) {
		Connection conn = null;
		PreparedStatement ps = null;
		
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
	
	
	
	public static CallableStatement getCallableStatement(String proc, ArrayList<String> params) {
		Connection conn = null;
		CallableStatement cs = null;
		
		try {
			conn = getConnection();
			cs = conn.prepareCall(proc);
			
			for(int i=0;i<params.size();i++) {
				cs.setString(i+1, params.get(i));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cs;
	}
	
	
	
	public static ResultSet select(String sql, ArrayList<String> params, boolean isProc){
		ResultSet rs = null;
		try {
			
			if(isProc) {
				//proc
				CallableStatement cs = getCallableStatement(sql, params);
				cs.registerOutParameter(params.size()+1, OracleTypes.CURSOR);
				cs.executeQuery();
				rs = (ResultSet) cs.getObject(params.size()+1);
			}else {
				//inline
				PreparedStatement ps = getPreparedStatement(sql, params);
				rs = ps.executeQuery();
			}
			
			
		} catch (Exception e) {
			
		}
		
		return rs;//업무처리 부분에서 받아서 처리
	}
	
	
	
	public static void insUpDel(String sql, ArrayList<String> params, boolean isProc) {
		try {
			if(isProc) {
				//proc
				CallableStatement cs = getCallableStatement(sql, params);
				cs.executeUpdate();
			}else {
				//inline
				PreparedStatement ps = getPreparedStatement(sql, params);
				ps.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
