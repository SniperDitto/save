package pkg.admin.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pkg.admin.DAO.MenuDAO;
import pkg.admin.DTO.MenuDTO;
@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuDAO menuDAO;
	
	@Override
	public List<MenuDTO> getMenuList() {
		return menuDAO.getMenuList();
	}
	
}
