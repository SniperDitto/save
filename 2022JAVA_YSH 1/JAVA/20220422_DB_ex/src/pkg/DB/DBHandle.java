package pkg.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.jdbc.internal.OracleTypes;

public class DBHandle {
	
	private Connection conn;
	private PreparedStatement ps;
	private CallableStatement cs;
	private ResultSet rs;
	
	public DBHandle() {
		getConn();
	}
	
	private void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			this.conn = DriverManager.getConnection(DBinfo.url, DBinfo.id, DBinfo.pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void setPS(String sql, ArrayList<String> params) {
		try {
			this.ps = this.conn.prepareStatement(sql);
			int index = 1;
			for(String s : params) {
				ps.setString(index, s);
				index++;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void setCS(String sql, ArrayList<String> params) {
		try {
			this.cs = this.conn.prepareCall(sql);
			int index = 1;
			for(String s : params) {
				cs.setString(index, s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getProcStr(String procName, int paramCnt) {
		//procName => PKG_ASDF.PROC_INS
		String result = "{call "+procName+"(";
		for(int i=0;i<paramCnt;i++) {
			result += "?";
			if(i!=paramCnt) result += ",";
		}
		result += ")}";
		return result;
	}
	
	public void dbInsUpDel(String sql, ArrayList<String> params, SQLType type) {
		try {
			if(type == SQLType.inline) {
				setPS(sql, params);
				ps.executeUpdate();
				ps.close();
			}
			else if(type == SQLType.procedure) {
				setCS(sql, params);
				cs.executeUpdate();
				cs.close();
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet dbSel(String sql, ArrayList<String> params, SQLType type, boolean isCursor) {
		try {
			if(type == SQLType.inline) {
				setPS(sql, params);
				this.rs = ps.executeQuery();
				rs.close();
				ps.close();
			}else if(type == SQLType.procedure) {
				setCS(sql, params);
				
				if(isCursor) {
					cs.registerOutParameter(params.size()+1, OracleTypes.CURSOR);
					cs.executeQuery();
					
					rs = (ResultSet) cs.getObject(params.size()+1);
				}else {
					this.rs = cs.executeQuery();
				}
				rs.close();
				cs.close();
			}
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return this.rs;
	}
	
}
