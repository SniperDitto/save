import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.concurrent.Callable;




public class Exec {
	
	public static void main(String[] args) {
		
		Scanner s = new Scanner(System.in);
		
		String id = "product";
		String pw = "1";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		User user = new User(id, pw, url);
		System.out.println("삭제할 사람 이름 입력");
		String userName = s.nextLine();
		user.userDelete("USER03");
		
		/*
		Connection dbConn = null;
		
		String id = "product";
		String pw = "1";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			dbConn = DriverManager.getConnection(url, id, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//System.out.println("user id 입력");
		//String userID = s.nextLine();
		System.out.println("user 이름 입력");
		String userNAME = s.nextLine();
		
		//inline query
		//String sql = "INSERT INTO USERS(USERID, USERNAME) VALUES(?, ?)";
		
		//procedure call
		String sql = "{call PKG_USERS.PROC_INS_USERS(?)}";
		
		try {*/
			/*
			//일반 sql문의 경우(inline query)
			PreparedStatement psmt = dbConn.prepareStatement(sql);
			psmt.setNString(1, userID);
			psmt.setNString(2, userNAME);
			psmt.executeUpdate();
			*/
			/*
			//프로시져 사용할 경우
			CallableStatement csmt = dbConn.prepareCall(sql);
			//csmt.setNString(1, userNAME);
			int i = csmt.executeUpdate();
			System.out.println("변경된 값 : "+Integer.toString(i));
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			System.out.println("됏다.");
		}
		*/
		
		
	}
}
