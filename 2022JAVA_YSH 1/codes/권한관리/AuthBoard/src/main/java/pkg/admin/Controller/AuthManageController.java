package pkg.admin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthManageController {
	
	@RequestMapping("authManager")
	public String goAuthManager() {
		
		
		return "/Admin/auth_manage";
	}
	
}
