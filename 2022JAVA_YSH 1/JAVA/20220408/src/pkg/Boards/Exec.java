package pkg.Boards;


public class Exec {

	public static void main(String[] args) {
		
		Boards freeBoards = new Boards("점심메뉴게시판");
		Boards asdf = new Boards("JAVA");
		
		User user1 = new User("U001","최밥창문");
		User user2 = new User("U002","안선미");
		User user3 = new User("U003","이정화");
		User user4 = new User("U004","원재경");
		User user5 = new User("U005","유승화");
		User user6 = new User("U006","이아라");
		Board board1 = new Board();
		Board board2 = new Board();
		Board board3 = new Board();
		Board board4 = new Board();
		Board board5 = new Board();
		
		user1.boardWrite(freeBoards, board1, user1);
		user2.boardWrite(freeBoards, board2, user2);
		user3.boardWrite(freeBoards, board3, user3);
		user4.boardWrite(freeBoards, board4, user4);
		user5.boardWrite(freeBoards, board5, user5);
		//user1.boardWrite(asdf, board3, user1);
		
		freeBoards.showBoardList();
		//asdf.showBoardList();
	}

}
