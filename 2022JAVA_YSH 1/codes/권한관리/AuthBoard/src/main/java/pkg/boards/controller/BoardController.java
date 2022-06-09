package pkg.boards.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class BoardController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("asdf");
		
		String data = "asdfsadfasdf";
		String data2 = "쉬발";
		String jspPage = "index.jsp";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("data",data);//받아낼 이름, 붙일 데이터
		mv.addObject("data2",data2);
		mv.setViewName(jspPage);
		
		return mv;
	}
	
	
	
}
