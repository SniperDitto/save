import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DBHandle {
	private String id;
	private String pw;
	private String url;
	private sqlQueryType sqlQueryType;
	
	public DBHandle(String id, String pw, String url) {
		this.id = id;
		this.pw = pw;
		this.url = url;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(this.url, this.id, this.pw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
	
	private PreparedStatement getPreparedStatement(String sql, String[] strParams) {
		PreparedStatement psmt = null;
		try {
			psmt = getConnection().prepareStatement(sql);
			
			int index = 1;
			for(String i : strParams) {
				psmt.setNString(index,i);
				index++;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return psmt;
	}
	
	private CallableStatement getCallableStatement(String sql, String[] strParams) {
		CallableStatement csmt = null;
		try {
			csmt = getConnection().prepareCall(sql);
			
			int index = 1;
			for(String i : strParams) {
				csmt.setNString(index,i);
				index++;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return csmt;
	}
	
	public void dbManage(String sql, String[] strParams, sqlQueryType sqlQueryType) {

		try {

			if (sqlQueryType == sqlQueryType.Inline) {
				PreparedStatement ps = getPreparedStatement(sql, strParams);
				ps.executeUpdate();
			} else if(sqlQueryType == sqlQueryType.Procedure){
				CallableStatement csmt = getCallableStatement(sql, strParams);
				csmt.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			System.out.println("완.");
		}
		
		
	}
	
	private void dbSelect() {}
	
}
