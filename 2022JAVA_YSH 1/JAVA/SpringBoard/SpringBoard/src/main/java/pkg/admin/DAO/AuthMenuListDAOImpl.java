package pkg.admin.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pkg.admin.DTO.MenuDTO;

@Repository
public class AuthMenuListDAOImpl implements AuthMenuListDAO{
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public AuthMenuListDAOImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MenuDTO> getMenusList(String menuName) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("menuName",menuName);
		
		sqlSession.selectList("selectMenusList",paramMap);
		
		List<MenuDTO> list = (List<MenuDTO>) paramMap.get("result");
		
		return list;
	}
	
}
