package pkg.admin.DAO;

import java.util.List;

import pkg.admin.DTO.MenuDTO;

public interface AuthMenuListDAO {
	public List<MenuDTO> getMenusList(String menuName);
}
