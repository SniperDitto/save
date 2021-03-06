package pkg.boards.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import pkg.boards.VO.BoardVO;

//@Service
public class BoardServiceImpl implements BoardService{

	@Override
	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> result = new ArrayList<BoardVO>();
		
		BoardVO vo1 = new BoardVO();
		vo1.setIdx("1");
		vo1.setTitle("유바나보");
		vo1.setUserID("USER01");
		result.add(vo1);
		
		BoardVO vo2 = new BoardVO();
		vo2.setIdx("2");
		vo2.setTitle(":)");
		vo2.setUserID("USER02");
		result.add(vo2);
		
		return result;
	}

	@Override
	public void deleteBoard(String idx) {
		
	}

	@Override
	public void updateBoard(String idx, BoardVO vo) {
		
	}

	@Override
	public void insertBoard(BoardVO vo) {
		
	}

}
