package pkg.boards.DAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pkg.boards.VO.BoardVO;

@Repository
public class ListDAOImpl implements ListDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardVO> getBoardList(String idx) {
		List<BoardVO> boardList = sqlSession.selectList("pkg.boards.list.selectBoard",idx);
		return boardList;
	}

	@Override
	public Map<String, Object> getProcBoardList(String idx) {
		//Map 타입으로 매개변수 주고 HashMap<"result", ArrayList<BoardVO>>로 보낸 map에 결과를 붙여서 받음
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		
		sqlSession.selectList("pkg.boards.list.procSelectBoard",map);
		//List<BoardVO> list = (cast) map.get("result");
		return map;
	}

	@Override
	public void insertBoardList(BoardVO vo) {
		
	}
	
	
	
}
