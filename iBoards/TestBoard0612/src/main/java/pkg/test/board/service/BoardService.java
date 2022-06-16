package pkg.test.board.service;

import pkg.test.board.DTO.BoardDTO;

import java.util.List;

public interface BoardService {
	
	public List<BoardDTO> getBoardList(String title);

}
