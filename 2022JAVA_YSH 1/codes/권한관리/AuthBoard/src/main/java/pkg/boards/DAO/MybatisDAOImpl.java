package pkg.boards.DAO;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import pkg.boards.VO.BoardVO;
import pkg.boards.VO.MemberVO;

public class MybatisDAOImpl implements BoardsDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<BoardVO> getBoardsList(String idx) {
		return null;
	}

	@Override
	public ArrayList<MemberVO> getMembers(String userID) {
		return null;
	}

	@Override
	public void saveBoard(String[] idx, String[] title, String[] userID, String[] status) {
		
	}

	@Override
	public void deleteBoard(String[] idx) {
		
	}

}
