package pkg.admin.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pkg.admin.DAO.AuthMenuListDAO;
import pkg.admin.DTO.MenuDTO;

@Service
public class AuthMenuListServiceImpl implements AuthMenuListService{

	private AuthMenuListDAO authMenuListDAO;
	
	@Autowired
	public AuthMenuListServiceImpl(AuthMenuListDAO authMenuListDAO) {
		this.authMenuListDAO = authMenuListDAO;
	}
	
	@Override
	public List<MenuDTO> getMenusList(String menuName) {
		
		return authMenuListDAO.getMenusList(menuName);
	}
	
}
