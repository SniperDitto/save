package pkg.admin.Service;

import java.util.List;
import java.util.Map;

import pkg.admin.DTO.AuthDTO;

public interface AuthListService {
	public List<AuthDTO> getAuthList(String authName);
	public Map<String, String[]> saveAuthList(Map<String, String[]> paramsMap);
	public Map<String, String[]> deleteAuthList(String[] authID);
}
