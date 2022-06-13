package pkg.admin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthManageController {
	
	@RequestMapping("index")
	public String goIndex() {
		return null;
		
	}
	
	@RequestMapping("authManager")
	public String goAuthManager(Model model) {
		
		model.addAttribute("data","testData");
		
		return "/Admin/auth_manage";
	}
	
}
