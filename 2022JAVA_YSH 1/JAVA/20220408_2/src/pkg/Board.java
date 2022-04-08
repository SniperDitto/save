package pkg;

import java.util.Scanner;

public class Board {
	
	private int regnum;
	private String strTitle;
	
	public Board() {}
	
	public void insert(String userID) {
		//INSERT INTO BOARDS(~) VALUES (~~);
		Scanner scan = new Scanner(System.in);
		System.out.print("글번호 : ");
		this.regnum = scan.nextInt();
		System.out.print("글제목 : ");
		this.strTitle = scan.next();
		
		//임시로 Boards 클래스에 배열로 저장
		
		
	}
	public void delete(int regnum) {
		//DELETE FROM BOARDS WHERE REGNUM = ???;
	}
	public void update(int regnum, String strTitle) {
		//UPDATE BOARDS SET TITLE=??? WHERE REGNUM=???;
	}

	public int getRegnum() {
		return regnum;
	}

	public String getStrTitle() {
		return strTitle;
	}
	
}
