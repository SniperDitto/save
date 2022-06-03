package pkg.admin.Service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pkg.admin.DAO.AuthMemberDAO;
import pkg.admin.DTO.AuthMemberDTO;

@Service
public class AuthMemberServiceImpl implements AuthMemberService{
	
	@Autowired
	private AuthMemberDAO authMemberDAO;
	
	@Override
	public List<AuthMemberDTO> getAuthMemberList(String searchText) {
		List<AuthMemberDTO> authMemberList = authMemberDAO.getAuthMemberList(searchText);
		return authMemberList;
	}

	@Override
	public void saveMemberList(Map<String, String[]> map) {
		authMemberDAO.saveMemberList(map);
	}
	
}
