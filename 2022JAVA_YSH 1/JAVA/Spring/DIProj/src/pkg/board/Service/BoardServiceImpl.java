package pkg.board.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pkg.board.DAO.BoardDAO;
import pkg.board.VO.BoardVO;

@Component("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public void printYoonaBabo() {
		System.out.println("유바나보");
	}
	
	public void insertYoonaBabo() {
		BoardVO vo = new BoardVO();
		vo.setIdx("123");
		vo.setTitle("최밥탱바보");
		boardDAO.boardInsert(vo);
	}

}
