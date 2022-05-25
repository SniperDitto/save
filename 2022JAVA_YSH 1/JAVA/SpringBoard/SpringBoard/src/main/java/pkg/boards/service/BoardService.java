package pkg.boards.service;

import java.util.ArrayList;

import pkg.boards.VO.BoardVO;

public interface BoardService {
	public ArrayList<BoardVO> getBoardList();
	
	public void deleteBoard(String idx);
	public void updateBoard(String idx, BoardVO vo);
	public void insertBoard(BoardVO vo);
}
