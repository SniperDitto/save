package pkg.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import oracle.jdbc.internal.OracleTypes;

public class DBUse {
	private Connection conn;
	private PreparedStatement ps;
	private CallableStatement cs;
	private ResultSet rs;
	private QueryKind qk;
	
	public DBUse() {
		getConn();
	}
	
	public QueryKind getQK() {
		return qk;
	}
	public void setQK(QueryKind qk) {
		this.qk = qk;
	}


	private void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(DBinfo.url, DBinfo.id, DBinfo.pw);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("getConn 옼케이.");
		}
		
	}
	
	private void setPS(String sql, String[] params) {
		try {
			ps = conn.prepareStatement(sql);
			int i=1;
			for(String s : params) {
				ps.setNString(i, s);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("setPS 옼케이.");
		}
	}
	
	private void setCS(String sql, String[] params) {
		try {
			cs = conn.prepareCall(sql);
			int i=1;
			for(String s : params) {
				cs.setNString(i, s);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			System.out.println("setCS 옼케이.");
		}
	}
	
	public void dbInsUpDel(String sql, String[] params, QueryKind qk) {
		int cnt = 0;
		try {
			if(qk==QueryKind.inline) {
				setPS(sql, params);
				cnt = ps.executeUpdate();
			}else if(qk==QueryKind.procedure) {
				setCS(sql, params);
				cnt = cs.executeUpdate();
			}
			//cs.close();
			//ps.close();
			//conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("dbHandle 옼케이.");
		}
	}
	
	public ResultSet dbSel(String sql, String[] params, boolean isCursor) {
		try {
			if(qk==QueryKind.inline) {
				setPS(sql, params);
				ps.executeQuery();
				//ps.close();
			}else if(qk==QueryKind.procedure) {
				setCS(sql, params);
				if(isCursor) {
					cs.registerOutParameter(params.length+1, OracleTypes.CURSOR);
					cs.executeQuery();
					
					rs = (ResultSet) cs.getObject(params.length+1);
					//rs2 = (ResultSet) cs.getObject(params.length+2);
				}else {
					rs = cs.executeQuery();
				}
				//rs.close();
				//cs.close();
			}
			//conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("getDBSelect 옼케이.");
		}
		
		return this.rs;
	}
	
}
