package pkg.board.service;

import java.util.ArrayList;

import pkg.board.VO.BoardVO;

public interface BoardService {
	public ArrayList<BoardVO> getBoardList(String idx);
	public void insUpBoard(BoardVO vo);
	public void deleteBoard(String idx);
}
