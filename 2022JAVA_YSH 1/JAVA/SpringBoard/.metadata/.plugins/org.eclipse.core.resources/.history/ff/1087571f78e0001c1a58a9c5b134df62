package pkg.admin.Service;

import java.util.List;

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

}
