import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class DBConnect {
	
	private String id;
	private String pw;
	private String url;
	
	public DBConnect() {
		
	}
	
	public DBConnect(String id, String pw, String url) {
		this.id = id;
		this.pw = pw;
		this.url = url;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(this.url, this.id, this.pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public PreparedStatement getPreparedStatement(String sql, String[] strParams) {
		PreparedStatement psmt = null;
		try {
			psmt = getConnection().prepareStatement(sql);
			
			int index = 0;
			for(String i : strParams) {
				psmt.setNString(index,i);
				index++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return psmt;
	}
	
	public void dbInsert(Board board) {
		try {
			String[] strParams = new String[4];
			strParams[0]=board.getIdx();
			strParams[1]=board.getTitle();
			strParams[2]=board.getUserID();
			strParams[3]="TO_DATE('2022-04-14',YYYY-MM-DD)";
			String sql = "INSERT INTO BOARD(IDX, TITLE, USERID, REGDATE) VALUES(?, ?, ?, ?)";
			
			PreparedStatement psmt = getPreparedStatement(sql, strParams);
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
