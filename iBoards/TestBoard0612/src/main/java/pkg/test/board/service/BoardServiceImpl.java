package pkg.test.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pkg.test.board.DAO.BoardDAO;
import pkg.test.board.DAO.BoardDAOImpl;
import pkg.test.board.DTO.BoardDTO;

import java.util.List;
@Service
public class BoardServiceImpl implements BoardService{
	
	private BoardDAO boardDAO;
	
	@Autowired
	public BoardServiceImpl(BoardDAO boardDAO){
		this.boardDAO = boardDAO;
	}
	
	@Override
	public List<BoardDTO> getBoardList(String title) {
		return boardDAO.getBoardList(title);
	}
}
