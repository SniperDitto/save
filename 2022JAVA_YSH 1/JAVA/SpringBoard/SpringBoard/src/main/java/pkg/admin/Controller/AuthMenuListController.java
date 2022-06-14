package pkg.admin.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pkg.admin.DTO.MenuDTO;
import pkg.admin.Service.AuthMenuListService;

@Controller
public class AuthMenuListController {
	
	private AuthMenuListService authMenuListService;
	
	@Autowired
	public AuthMenuListController(AuthMenuListService authMenuListService) {
		this.authMenuListService = authMenuListService;
	}
	
	@RequestMapping("")
	public String getMenusList(String menuName, Model model) {
		
		List<MenuDTO> menuList = authMenuListService.getMenusList(menuName);
		
		model.addAttribute("menusList",menuList);
		
		return "/Admin/menusList";
	}
	
	@RequestMapping("")
	public String getSubMenusList() {
		
		return "/Admin/menusList";
	}
	
}
