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

	@Override
	public void saveMemberList(Map<String, String[]> map) {
		Map<String, Object> params=null;
		String[] mID = map.get("mID");
		String[] mName = map.get("mName");
		String[] authID = map.get("authID");
		String[] mthID = map.get("mthID");
		String[] hval = map.get("hval");
		
		String errCode = "";
		String errMsg = "";
		
		for(int i=0;i<mID.length;i++) {
			if(hval[i]!=null) {
				params = new HashMap<String, Object>();
				params.put("mID", mID);
				params.put("mName", mName);
				params.put("authID", authID);
				params.put("mthID", mthID);
			}
		}
		
		sqlSession.selectList("saveMemberList",params);
		errCode = (String) params.get("errCode");
		errMsg = (String) params.get("errMsg");
		
		
	}
	
}
