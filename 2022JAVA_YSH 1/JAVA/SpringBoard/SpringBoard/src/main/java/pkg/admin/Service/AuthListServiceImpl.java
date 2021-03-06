package pkg.admin.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pkg.admin.DAO.AuthListDAO;
import pkg.admin.DTO.AuthDTO;

@Service
public class AuthListServiceImpl implements AuthListService{
	
	@Autowired
	private AuthListDAO authListDAO;

	@Override
	public List<AuthDTO> getAuthList(String authName) {
		
		return authListDAO.getAuthList(authName);
	}

	@Override
	public Map<String, String[]> saveAuthList(Map<String, String[]> paramsMap) {
		return authListDAO.saveAuthList(paramsMap);
	}

	@Override
	public Map<String, String[]> deleteAuthList(String[] authID) {
		return authListDAO.deleteAuthList(authID);
	}

}
