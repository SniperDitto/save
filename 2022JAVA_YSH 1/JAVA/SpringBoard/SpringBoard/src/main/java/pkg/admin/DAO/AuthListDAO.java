package pkg.admin.DAO;

import java.util.List;

import pkg.admin.DTO.AuthDTO;

public interface AuthListDAO {
	public List<AuthDTO> getAuthList(String authName);
}
