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

	@Override
	public Map<String, String[]> saveAuthList(Map<String, String[]> paramsMap) {
		String[] authID = paramsMap.get("authID");
		String[] authName = paramsMap.get("authName");
		String[] gbn = paramsMap.get("gbn");
		
		Map<String, String[]> errMap = new HashMap<String, String[]>();
		String[] errCode = new String[authName.length];
		String[] errMsg = new String[authName.length];
		
		for(int i=0;i<authName.length;i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			if(authID[i]=="") {
				map.put("authID", "");
			}else {
				map.put("authID", authID[i]);
			}
			map.put("authName", authName[i]);
			map.put("gbn", gbn[i]);
			System.out.println(authID[i]+" "+authName[i]+" "+gbn[i]);
			
			if(gbn[i]!=null) sqlSession.selectList("saveAuthList",map);
			
			errCode[i] = (String) map.get("errCode");
			errMsg[i] = (String) map.get("errMsg");
		}
		
		errMap.put("errCode", errCode);
		errMap.put("errMsg", errMsg);
		
		return errMap;
		
	}

	@Override
	public Map<String, String[]> deleteAuthList(String[] authID) {
		
		Map<String, String[]> errMap = new HashMap<String, String[]>();
		String[] errCode = new String[authID.length];
		String[] errMsg = new String[authID.length];
		
		if(authID!=null) {
		for(int i=0;i<authID.length;i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("authID", authID[i]);
			
			if(authID[i]!=null) sqlSession.selectList("deleteAuthList",map);
			
			errCode[i] = (String) map.get("errCode");
			errMsg[i] = (String) map.get("errMsg");
		}
		}
		errMap.put("errCode", errCode);
		errMap.put("errMsg", errMsg);
		
		return errMap;
	}
	
}
