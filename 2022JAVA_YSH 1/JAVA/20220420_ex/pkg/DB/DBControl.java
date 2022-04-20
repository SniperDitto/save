package pkg.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import oracle.jdbc.internal.OracleTypes;

public class DBControl {
	
	private Connection conn;
	private PreparedStatement ps;
	private CallableStatement cs;
	private ResultSet rs;
	
	public DBControl() {
		getConn();
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
	
	private void setPS(String sql, String[] params) {
		try {
			this.ps = conn.prepareStatement(sql);
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
	
	private void setCS(String sql, String[] params) {
		try {
			this.cs = conn.prepareCall(sql);
			int index = 1;
			for(String s : params) {
				cs.setString(index, s);
				index++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dbInsUpDel(String sql, String[] params, SqlType type) {
		
		try {
			if(type == SqlType.Inline) {
				setPS(sql, params);
				ps.executeUpdate();
				ps.close();
			}else if(type == SqlType.Procedure) {
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
	
	public ResultSet dbSel(String sql, String[] params, SqlType type, boolean isCursor) {
		
		try {
			if(type == SqlType.Inline) {
				setPS(sql, params);
				this.rs = ps.executeQuery();
				rs.close();
				ps.close();
			}else if(type == SqlType.Procedure) {
				setCS(sql, params);
				
				if(isCursor) {
					cs.registerOutParameter(params.length+1, OracleTypes.CURSOR);
					cs.executeQuery();
					
					rs = (ResultSet) cs.getObject(params.length+1);
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
	
	public ArrayList<HashMap<String, Object>> getResList(ResultSet resultSet){
		ArrayList<HashMap<String, Object>> aList = new ArrayList<HashMap<String,Object>>();
		
		try {
			ResultSetMetaData meta = resultSet.getMetaData();
			while(resultSet.next()) {
				for(int i=1;i<meta.getColumnCount();i++) {
					HashMap<String, Object> data = new HashMap<String, Object>();
					data.put(meta.getColumnLabel(i), resultSet.getObject(i));
					aList.add(data);
					System.out.println(data.toString());
				}
			}
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return aList;
	}
	
	public String getInsSQL(String tableName, String[] colNames) {
		String sql = "INSERT";
		//INSERT INTO TABLENAME(A,B,C) VALUES (?, ?, ?)
		sql += " INTO "+ tableName + "(";
			
		int index = 0;
		for(String s : colNames) {
			sql += s;
			index++;
			if(index!=colNames.length) sql += ", ";
		}
		
		sql += ") ";
		sql += "VALUES (";
		
		for(int i=0;i<colNames.length;i++) {
			sql += "?";
			if(i!=colNames.length) sql += ", ";
		}
		sql += ")";

		return sql;
	}
	
	
}
