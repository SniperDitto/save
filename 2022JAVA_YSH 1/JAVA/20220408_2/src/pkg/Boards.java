package pkg;

import java.util.ArrayList;

public class Boards {
	
	private ArrayList<Board> boardList;
	
	public Boards() {
		this.boardList = new ArrayList<Board>();
	}
	
	public void insert(Board board) {
		boardList.add(board);
	}
	
	public void getBoardList() {
		System.out.println("글번호\t\t글제목");
		for(Board b : boardList) {
			System.out.print(b.getRegnum()+"\t\t");
			System.out.println(b.getStrTitle());
		}
	}
	
}
