package pkg.boards.DAO;

import java.util.List;
import java.util.Map;

import pkg.boards.VO.BoardVO;

public interface ListDAO {
	public List<BoardVO> getBoardList(String idx);
	public Map<String, Object> getProcBoardList(String idx);
	public void insertBoardList(BoardVO vo);
}
