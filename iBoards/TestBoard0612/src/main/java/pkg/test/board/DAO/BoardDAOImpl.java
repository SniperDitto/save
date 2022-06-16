package pkg.test.board.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pkg.test.board.DTO.BoardDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDAOImpl implements BoardDAO{
	SqlSessionTemplate sqlSession;
	
	@Autowired
	public BoardDAOImpl(SqlSessionTemplate sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public List<BoardDTO> getBoardList(String title){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("title",title);
		
		sqlSession.selectList("",paramMap);
		List<BoardDTO> list = (List<BoardDTO>) paramMap.get("result");
		
		return list;
	}
	
}
