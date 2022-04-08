package pkg.Boards;


public class User {

	private String userID;
	private String userName;
	
	public User() {}
	public User(String userID, String userName) {
		this.userID = userID;
		this.userName = userName;
	}
	
	
	public String getUserID() {
		return userID;
	}
	public String getUserName() {
		return userName;
	}
	
	
	public void boardWrite(Boards boards, IBoard board, User user) {
		//글을 쓰면 게시물 객체 하나가 생성된다
		board.insert(user);
		
		boards.addBoardList(board);
	}

}
