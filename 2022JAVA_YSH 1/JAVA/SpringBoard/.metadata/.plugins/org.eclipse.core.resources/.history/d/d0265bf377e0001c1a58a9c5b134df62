package pkg.admin.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pkg.admin.DTO.AuthDTO;

@Repository
public class AuthListDAOImpl implements AuthListDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AuthDTO> getAuthList(String authName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authName", authName);
		
		sqlSession.selectList("selectAuthList",map);
		List<AuthDTO> list = (List<AuthDTO>) map.get("result");
		
		return list;
	}
	
}
