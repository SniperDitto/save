package pkg.service;

import java.util.ArrayList;

public class BoardServiceImpl implements BoardService{

	@Override
	public ArrayList<String> getBoardList() {
		ArrayList<String> boards = new ArrayList<String>();
		boards.add("asdf");
		boards.add("asdf");
		boards.add("asdf");
		boards.add("asdf");
		return boards;
	}

}
