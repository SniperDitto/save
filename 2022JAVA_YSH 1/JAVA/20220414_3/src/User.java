
public class User {
	
	private String userID;
	private DBConnect dbConnect;
	
	public User(String userID) {
		this.userID = userID;
		this.dbConnect = new DBConnect();
	}
	
	public void boardInsert(Board board) {
		//DBConnect에 정보 전달해 insert시킴
		dbConnect.dbInsert(board);
	}
	
}
