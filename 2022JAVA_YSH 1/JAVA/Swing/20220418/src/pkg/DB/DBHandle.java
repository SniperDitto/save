package pkg.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import oracle.jdbc.internal.OracleTypes;

public class DBHandle {
	
	private String url;
	private String id;
	private String pw;
	private QueryKind queryKind;
	
	public DBHandle(String url, String id, String pw) {
		this.url = url;
		this.id = id;
		this.pw = pw;
	}
	
	private Connection getConn() {
		Connection conn = null;
		
		try {
			//driver loading
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//Connection
			conn = DriverManager.getConnection(this.url, this.id, this.pw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
	private PreparedStatement getPS(String sql, String[] params) {
		PreparedStatement ps = null;
		Connection conn = getConn();
		try {
			ps = conn.prepareStatement(sql);
			int i = 1;
			for(String s : params) {
				ps.setNString(i, s);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ps;
	}
	
	private CallableStatement getCS(String sql, String[] params) {
		CallableStatement cs = null;
		Connection conn = getConn();
		try {
			cs = conn.prepareCall(sql);
			int i = 1;
			for(String s : params) {
				cs.setNString(i, s);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cs;
	}
	
	
	public ResultSet dbSelect(String sql, String[] params, QueryKind queryKind, boolean isCursor) {
		ResultSet rs = null;
		
		try {
			if(queryKind == QueryKind.inline) {
				PreparedStatement ps = getPS(sql, params);
				rs = ps.executeQuery();
			}
			else if(queryKind == QueryKind.procedure) {
				CallableStatement cs = getCS(sql, params);
				if(isCursor) {
					//O_CUR 있을 때 사용
					cs.registerOutParameter(params.length+1, OracleTypes.CURSOR);
					cs.executeQuery();
					
					rs = (ResultSet) cs.getObject(params.length+1);
					//rs2 = (ResultSet) cs.getObject(params.length+2);
				}
				else {
					rs = cs.executeQuery();
				}
				
			}
			getConn().close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//System.out.println("완.");
		}
		
		return rs;
	}
	
	
	public int dbManage(String sql, String[] params, QueryKind queryKind) {
		int cnt = 0;
		
		try {
			if(queryKind == QueryKind.inline) {
				PreparedStatement ps = getPS(sql, params);
				cnt = ps.executeUpdate();
				
			}
			else if(queryKind == QueryKind.procedure) {
				CallableStatement cs = getCS(sql, params);
				cnt = cs.executeUpdate();
			}
			getConn().close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//System.out.println("완.");
		}
		
		return cnt;
	}
	
}
