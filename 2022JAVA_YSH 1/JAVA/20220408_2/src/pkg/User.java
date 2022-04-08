package pkg;

public class User {
	
	private String userID;
	
	public User(String userID) {
		this.userID = userID;
	}

	public void write(Board board) {
		board.insert(this.userID);
		
	}
	
}
