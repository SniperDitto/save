package pkg.admin.DAO;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pkg.admin.DTO.AuthMemberDTO;

@Repository
public class AuthMemberDAOImpl implements AuthMemberDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AuthMemberDTO> getAuthMemberList(String searchText) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchText", searchText);
		
		sqlSession.selectList("selectAuthMemberList",map);
		List<AuthMemberDTO> authMemberList = (List<AuthMemberDTO>) map.get("result");
		
		return authMemberList;
	}
	
}
