package pkg.test.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	/*
	@RequestMapping("/start")
	public String IndexPage(){
		return "index";//or 따로 로그인 페이지가 있다면 그쪽으로(왠만하면 /start 쓰지말기)
	}
	*/
	
	@RequestMapping("loginPage")
	public String LoginPage(){
		
		return "login/loginPage";
	}
	
	@RequestMapping("login")
	public String Login(String adminID, String adminPW, HttpSession session){
		String page = "";
		
		String id = "ADMIN";
		String pw = "1234";
		
		if(adminID.equals(id) && adminPW.equals(pw)){
			session.setAttribute("adminID",adminID);
			page = "redirect:boardList";
		}else{
			page = "redirect:login";
		}
		
		return page;
	}
	
	@RequestMapping("logout")
	public String Logout(HttpSession session){
		session.invalidate();
		return "index";
	}
	
	
}
