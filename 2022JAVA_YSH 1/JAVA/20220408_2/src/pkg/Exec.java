package pkg;

public class Exec {

	public static void main(String[] args) {
		Boards boardList = new Boards();
		User user = new User("U001");
		Board board = new Board();
		Board board2 = new Board();
		Board board3 = new Board();
		
		//회원이 글을 작성한다
		user.write(board);
		user.write(board2);
		user.write(board3);
		
		boardList.insert(board);
		boardList.insert(board2);
		boardList.insert(board3);
		
		boardList.getBoardList();
		
	}

}
