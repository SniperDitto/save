package Pkg.Client.Members;

import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	public boolean checkID(String checkID) {
		boolean isDuple = false;
		
		try {
			String sql = "{call PKG_MEMS.PROC_CHECKID(?,?)}";
			ArrayList<String> params = new ArrayList<String>();
			params.add(checkID);
			
			ResultSet rs = DBConn.select(sql, params, true);
			rs.next();
			String s = rs.getString("RESULT");
			if(s.equals("EXIST")) {
				isDuple = true;
				System.out.printf("아이디 존재");
			}else {
				System.out.printf("아이디 존재하지 않음");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isDuple;
		
	}
	
	
	public String login(String userID, String userPass) {
		String loginUser="";
		
		try {
			String sql = "{call PKG_MEMS.PROC_LOGIN(?,?,?)}";
			ArrayList<String> params = new ArrayList<String>();
			params.add(userID);
			params.add(userPass);
			
			ResultSet rs = DBConn.select(sql, params, true);
			rs.next();
			String s = rs.getString("RESULT");
			if(!s.equals("FAIL")) {
				loginUser = s;
				System.out.println(loginUser+"로 로그인됨");
			}else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return loginUser;
	}
	
}
