package pkg.admin.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("adminLogin")
	public String Login(String adminLoginID, String adminLoginPW, HttpSession session) {
		
		if(adminLoginID.equals("ADMIN") && adminLoginPW.equals("1234")) {
			session.setAttribute("adminID", adminLoginID);
			
		}
		
		return "/Admin/auth_manage";
	}
	
	@RequestMapping("Login")
	public String gotoLoginPage() {
		return "login";
	}
	
}
