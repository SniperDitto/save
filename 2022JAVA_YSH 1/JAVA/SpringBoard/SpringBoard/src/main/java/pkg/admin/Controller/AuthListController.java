package pkg.admin.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pkg.admin.DTO.AuthDTO;
import pkg.admin.Service.AuthListService;

@Controller
public class AuthListController {
	
	@Autowired
	private AuthListService authListService;
	
	@RequestMapping("authList")
	public String getAuthList(String authNameSearch, Model model) {
		
		List<AuthDTO> authList = null;
		if(authNameSearch==null) {
			authList=authListService.getAuthList("");
		}else {
			authList=authListService.getAuthList(authNameSearch);
		}
		
		model.addAttribute("authNameSearch",authNameSearch);
		model.addAttribute("authList",authList);
		
		return "/Admin/authList/authList";
	}
	
	@RequestMapping("saveAuthList")
	public String saveAuthList(String[] authID, String[] authName, String[] gbn) {
		Map<String, String[]> paramsMap = new HashMap<String, String[]>();
		
		paramsMap.put("authID", authID);
		paramsMap.put("authName", authName);
		paramsMap.put("gbn", gbn);
		
		Map<String, String[]> errMap = authListService.saveAuthList(paramsMap);

		return "redirect:authList?authName=";
	}
	
	@RequestMapping()
	public String deleteAuthList(String[] authID) {
		
		Map<String, String[]> errMap = authListService.deleteAuthList(authID);
		
		return "redirect:authList?authName=";
	}
	
}
