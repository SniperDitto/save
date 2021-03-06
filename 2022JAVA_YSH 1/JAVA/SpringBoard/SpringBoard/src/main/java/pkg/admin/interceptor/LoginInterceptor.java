package pkg.admin.interceptor;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler) throws Exception {
		System.out.println("preHandle");
		//dispatcher-servlet -> Controller 중간에 호출
		
		//로그인관리
		//boolean isLogin = false;
		HttpSession session = httpServletRequest.getSession();
		
		//로그인 안된 상태면
		if(session.getAttribute("adminID")==null) {
			//세션 유무만 판단하고 처리를 따로 controller에서 한다
			/*
			String adminLoginID = httpServletRequest.getParameter("adminLoginID");
			String adminLoginPW = httpServletRequest.getParameter("adminLoginPW");
			
			httpServletRequest.setAttribute("adminLoginID", adminLoginID);
			httpServletRequest.setAttribute("adminLoginPW", adminLoginPW);
			*/
			httpServletResponse.sendRedirect("/Login");
			
			
			
		}

		
		//페이지 로그 관리
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle");
		//Controller -> view page(jsp) 중간에 호출
		
		String jspPageName = modelAndView.getViewName();
		Map<String, Object> modelMap = modelAndView.getModel();//model.addAttribute("이름",데이터);로 보낸 것
		
		String data = (String) modelMap.get("data");
		
		modelAndView.addObject("data2", "testData2");
		//공용으로 쓰는 데이터를 일반적으로 여기에서 붙인다
		
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, Exception exception) {
		System.out.println("afterCompletion");
		//html rendering 이후 
		
	}
}
