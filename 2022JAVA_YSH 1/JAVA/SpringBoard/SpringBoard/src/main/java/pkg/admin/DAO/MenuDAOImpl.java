package pkg.admin.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pkg.admin.DTO.MenuDTO;
@Repository
public class MenuDAOImpl implements MenuDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MenuDTO> getMenuList() {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		sqlSession.selectList("selectSMenuList",paramMap);
		List<MenuDTO> menuList = (List<MenuDTO>) paramMap.get("result");
		
		return menuList;
	}

}
