package pkg.DB;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBHandle {
	private String id;
	private String pw;
	private String url;
	
	public DBHandle() {
		this.id = "product";
		this.pw = "1";
		this.url = "jdbc:oracle:thin:@localhost:1521:XE";
	}
	
	public void insert(ArrayList<String> params) throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection dbCon = DriverManager.getConnection(url,id,pw);
		String proc = "{call PKG_ERRORS.PROC_ERR_INS(?,?,?,?)}";
		
		CallableStatement cs = dbCon.prepareCall(proc);
		int index = 1;
		for(String s : params) {
			cs.setString(index, s);
			index++;
		}
		
		cs.executeUpdate();
		
		cs.close();
		dbCon.close();
		
	}
}
