package pkg.admin.Service;

import java.util.List;

import pkg.admin.DTO.MenuDTO;

public interface AuthMenuListService {
	public List<MenuDTO> getMenusList(String menuName);
}
