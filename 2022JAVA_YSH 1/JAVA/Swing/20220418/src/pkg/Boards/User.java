package pkg.Boards;

import java.sql.ResultSet;
import java.util.Scanner;

import pkg.DB.DBHandle;
import pkg.DB.DBUse;
import pkg.DB.DBinfo;
import pkg.DB.QueryKind;

public class User {
	private String userID;
	private String userName;
	private String userPW;
	private DBHandle dbHandle;
	private boolean isLogin;
	private DBUse dbUse;
	
	public User() {
		this.isLogin = false;
		this.dbHandle = new DBHandle(DBinfo.url, DBinfo.id, DBinfo.pw);
	}
	
	/*getter, setter*/
	public String getUserID() {
		return userID;
	}
	public String getUserName() {
		return userName;
	}
	public String getUserPW() {
		return userPW;
	}
	public boolean getIsLogin() {
		return isLogin;
	}
	/**/
	


	public boolean login() {
		
		loginUI();
		boolean isLoggedIn = false;
		
		String sql = "SELECT DECODE(MAX(USERID),NULL,'f','s') AS STATUS\r\n" + 
				"    ,MAX(USERID) AS USERID\r\n" + 
				"    ,MAX(USERNAME) AS USERNAME\r\n" + 
				"FROM USERS\r\n" + 
				"WHERE USERID=? \r\n" + 
				"    AND USERPW=?";
		String[] params = new String[2];
		params[0] = userID;
		params[1] = userPW;
		
		ResultSet rs = this.dbHandle.dbSelect(sql, params, QueryKind.inline, false);
		
		String status="";
		String userid="";
		String username="";
		
		try {
			while(rs.next()) {
				status = rs.getNString("STATUS");
				userid = rs.getNString("USERID");
				username = rs.getNString("USERNAME");
				System.out.println(status+"\t\t"+userid+"\t\t"+username);
			}
			
			if(status.equals("s")) {
				System.out.println("로그인 완.");
				isLoggedIn = true;
				this.isLogin = true;
			}else if(status.equals("f")){
				System.out.println("쉴패~!~!~~!");
				login();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//System.out.println("완.");
		}
		
		return isLoggedIn;
	}
	
	private void loginUI() {
		Scanner s = new Scanner(System.in);
		System.out.print("아이디 : ");
		this.userID = s.nextLine();
		System.out.print("비밀번호 : ");
		this.userPW = s.nextLine();
	}
	
}
