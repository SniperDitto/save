package Pkg.Client.Members;

import java.sql.ResultSet;
import java.util.ArrayList;

import Pkg.DB.DBConn;

public class MemberService {
	
	public boolean chkLogin(String userID, String userPass) {
		boolean result=false;
		String sql = "{call PKG_MEMS.PROC_LOGIN(?,?,?)}";
		ArrayList<String> params = new ArrayList<String>();
		
		try {
			params.add(userID);
			params.add(userPass);
			
			ResultSet rs = DBConn.select(sql, params, true);
			rs.next();
			String s = rs.getString("RESULT");
			System.out.println(s+" 계정으로 로그인됨.");
			if(!s.equals("FAIL")) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
}
