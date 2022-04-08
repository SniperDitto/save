package pkg.Boards;

import java.util.ArrayList;

public class Boards {
	//게시판
	private String boardName;
	private ArrayList<IBoard> boardList;
	
	public Boards() {}
	public Boards(String boardName) {
		this.boardName = boardName;
		this.boardList = new ArrayList();
	}
	public void addBoardList(IBoard board) {
		this.boardList.add(board);
	}
	public void showBoardList() {
		System.out.printf("<<"+this.boardName+">>\n");
		System.out.println("글번호\t작성자\t\t제목\t\t작성일");
		for(IBoard board : this.boardList) {
			System.out.println(
					Integer.toString(((Board) board).getRegNum())
					+"\t"+((Board) board).getUser().getUserName()
					+"\t\t"+((Board) board).getTitle()
					+"\t\t"+((Board) board).getRegDate());
		}
	}

}
