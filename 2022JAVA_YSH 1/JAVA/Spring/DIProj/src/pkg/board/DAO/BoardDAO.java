package pkg.board.DAO;

import java.util.ArrayList;

import pkg.board.VO.BoardVO;

public interface BoardDAO {
	public ArrayList<BoardVO> getBoardList();
	public void boardInsert(BoardVO vo);
	public void boardUpdate(String idx, BoardVO vo);
	public void boardDelete(String idx);
}
