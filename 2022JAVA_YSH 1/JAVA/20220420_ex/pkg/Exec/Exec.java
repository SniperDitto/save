package pkg.Exec;

import java.sql.ResultSet;

import pkg.DB.DBControl;
import pkg.DB.SqlType;

public class Exec {

	public static void main(String[] args) {
		
		DBControl db = new DBControl();
		String sql = db.getProcStr("//////여기부터//////", 1);
		String[] params = {};
		
		db.getResList(db.dbSel(sql, params, SqlType.Procedure, true));
		
		
		
	}

}
