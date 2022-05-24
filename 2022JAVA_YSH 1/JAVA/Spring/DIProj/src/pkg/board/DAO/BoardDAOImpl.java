package pkg.board.DAO;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import pkg.board.VO.BoardVO;

@Component
public class BoardDAOImpl implements BoardDAO{

	@Override
	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		
		BoardVO vo = new BoardVO();
		vo.setIdx("1");
		vo.setTitle("유바나보");
		boardList.add(vo);
		
		return null;
	}

	@Override
	public void boardInsert(BoardVO vo) {
		
	}

	@Override
	public void boardUpdate(String idx, BoardVO vo) {
		
	}

	@Override
	public void boardDelete(String idx) {
		
	}
	
}
