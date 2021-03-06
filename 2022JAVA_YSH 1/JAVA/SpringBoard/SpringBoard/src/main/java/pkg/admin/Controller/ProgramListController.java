package pkg.admin.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping("saveProgramList")
	public String saveProgramList(@RequestBody Map<String, ArrayList<ProgramDTO>> menuDatas) {
		
		ArrayList<ProgramDTO> params = menuDatas.get("datas");
		/////////////////////////
		return "/Admin/programList/programList";
	}
	
	@ResponseBody
	@RequestMapping("menuList")
	public String getMenuList() {
		List<MenuDTO> menuList = menuService.getMenuList();
		//json 만들어서 리턴
		
		String menuID = "";
		String menuName = "";
		JSONArray jsonArray = new JSONArray();
		
		for(MenuDTO dto : menuList) {
			
			menuID = dto.getMenuID();
			menuName = dto.getMenuName();
			
			JSONObject menuObj = new JSONObject();
			//ajax 이름 & 값
			menuObj.put("menuID", menuID);
			menuObj.put("menuName", menuName);
			
			jsonArray.add(menuObj);
			
		}
		return jsonArray.toString();
	}
	
	@ResponseBody
	@RequestMapping("delMenu")
	public String delMenuList(@RequestBody Map<String, ArrayList<ProgramDTO>> map ) {
		
		ArrayList<ProgramDTO> delList = map.get("delPid");
		
		
		return "success";
	}
	
	
	
	
}
