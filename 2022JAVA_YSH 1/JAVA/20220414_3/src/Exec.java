import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Exec {

	public static void main(String[] args) {
		
		String[] strParams = new String[4];
		Scanner s = new Scanner(System.in);
		
		System.out.print("글번호 : ");
		strParams[0] = s.nextLine();
		
		System.out.print("글제목 : ");
		strParams[1] = s.nextLine();
		
		System.out.print("작성자ID : ");
		strParams[2] = s.nextLine();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		strParams[3] = simpleDateFormat.format(new Date());
		
		DBHandle dbHandle = new DBHandle("product", "1", "jdbc:oracle:thin:@localhost:1521:XE");
		String sql = "INSERT INTO BOARD(IDX, TITLE, USERID, REGDATE) VALUES(?,?,?,?)";
		
 		dbHandle.dbManage(sql,strParams,sqlQueryType.Inline);
		
		
		
		
	}

}
