package pkg.admin.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LogInterceptor implements HandlerInterceptor{
	
	public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler) {
		//dispatcher-servlet -> Controller 중간에 호출
		
		//로그인관리
		//페이지 로그 관리
		
		return true;
	}
	
	
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, ModelAndView modelAndView) throws Exception {
		//Controller -> view page(jsp) 중간에 호출
		
		String jspPageName = modelAndView.getViewName();
		Map<String, Object> modelMap = modelAndView.getModel();//model.addAttribute("이름",데이터);로 보낸 것
		
		String data = (String) modelMap.get("data");
		
		modelAndView.addObject("data2", "testData2");
		//공용으로 쓰는 데이터를 일반적으로 여기에서 붙인다
		
		
	}
	
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, Exception exception) {
		//html rendering 이후 
		
	}
	
}
