package pkg.Boards;

import java.util.Scanner;

public class Board implements IBoard{
	//게시글

	//1. 작성자 String
	//2. 글제목 String
	//3. 내용	String
	//4. 작성일 String
	//5. 글번호 int
	private User user;
	private String title;
	private String content;
	private String regDate;
	private int regNum;
	
	public Board() {}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getRegNum() {
		return regNum;
	}
	public void setRegNum(int regNum) {
		this.regNum = regNum;
	}
	public User getUser() {
		return user;
	}
	
	@Override
	public void insert(User user) {
		
		this.user = user;
		System.out.println("작성자 : "+this.user.getUserName());
		Scanner scanner = new Scanner(System.in);
		System.out.print("글제목을 입력하세요\n->");
		this.title = scanner.nextLine();
		System.out.print("글내용을 입력하세요\n->");
		this.content = scanner.nextLine();
		System.out.print("작성일을 입력하세요\n->");
		this.regDate = scanner.nextLine();
		System.out.println("작성 완.");
		
		
	}
	@Override
	public void delete() {
		System.out.println("글 삭제");
	}
	@Override
	public void update() {
		System.out.println("글 수정");
	}

	
}
