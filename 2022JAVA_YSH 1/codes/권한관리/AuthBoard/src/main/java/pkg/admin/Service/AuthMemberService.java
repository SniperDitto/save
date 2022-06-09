package pkg.admin.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import pkg.admin.DTO.AuthMemberDTO;

public interface AuthMemberService {
	public List<AuthMemberDTO> getAuthMemberList(String searchText);
	public void saveMemberList(Map<String, String[]> map);
}
