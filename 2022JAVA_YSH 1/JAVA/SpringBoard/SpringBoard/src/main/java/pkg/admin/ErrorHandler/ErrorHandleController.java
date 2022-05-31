package pkg.admin.ErrorHandler;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorHandleController {
	
	@RequestMapping("errorHandle")
	public String goErrorPage(String errorCode, String errorMsg, Model model) {
		
		
		if(errorCode.equals("404")) {
			errorMsg="페이지가 없어요";
		}else if(errorCode.equals("500")) {
			errorMsg="서버 에러";
		}
		
		model.addAttribute("errorCode",errorCode);
		model.addAttribute("errorMsg",errorMsg);
		
		return "/Admin/adminError/err";
	}
}
