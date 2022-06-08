package pkg.admin.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import pkg.admin.DTO.MenuDTO;
import pkg.admin.DTO.ProgramDTO;
import pkg.admin.Service.MenuService;
import pkg.admin.Service.ProgramService;

@Controller
public class ProgramListController {

	private final ProgramService programService;
	private final MenuService menuService;
	
	@Autowired
	public ProgramListController(ProgramService programService,MenuService menuService) {
		this.programService = programService;
		this.menuService = menuService;
	}
	
	@RequestMapping("programList")
	public String getProgramList(String pName, Model model) {
		
		List<ProgramDTO> programList = programService.getProgramList(pName);
		List<MenuDTO> menuList = menuService.getMenuList();
		model.addAttribute("programList",programList);
		model.addAttribute("menuList",menuList);
		
		return "/Admin/programList/programList";
	}
	
	@RequestMapping("saveProgramList")
	public String saveProgramList(@RequestBody Map<String, ArrayList<ProgramDTO>> menuDatas, Model model) {
		
		
		
		return "/Admin/programList/programList";
	}
	
	
	
}
