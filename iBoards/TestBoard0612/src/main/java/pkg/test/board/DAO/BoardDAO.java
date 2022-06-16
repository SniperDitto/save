package pkg.test.board.DAO;

import pkg.test.board.DTO.BoardDTO;

import java.util.List;

public interface BoardDAO {
	public List<BoardDTO> getBoardList(String title);
}
