package pkg.boards.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pkg.boards.DAO.BoardsDAO;
import pkg.boards.VO.BoardVO;
import pkg.boards.VO.MemberVO;

@Service
public class BoardsServiceImpl implements BoardsService{
	
	@Autowired
	private BoardsDAO boardsDAO;
	
	@Override
	public ArrayList<BoardVO> getBoardList(String idx) {
		return boardsDAO.getBoardsList(idx);
	}

	@Override
	public ArrayList<MemberVO> getMemberList(String userID) {
		return boardsDAO.getMembers(userID);
	}

	@Override
	public void saveBoard(String[] idx, String[] title, String[] userID, String[] status) {
		boardsDAO.saveBoard(idx, title, userID, status);
	}

	@Override
	public void deleteBoard(String[] idx) {
		boardsDAO.deleteBoard(idx);
	}
	
}
