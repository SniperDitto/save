package pkg.test.board.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("preHandle");
		HttpSession session = request.getSession();
		if(session!=null){
			String adminID = (String) session.getAttribute("adminID");
			
			if(adminID==null){
				response.sendRedirect("/loginPage");
				return false;
			}
		}
		
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{
		System.out.println("postHandle");
		
		HandlerInterceptor.super.postHandle(request,response,handler,modelAndView);
		
	}
	
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) throws Exception {
		System.out.println("afterCompletion");
		
		HandlerInterceptor.super.afterCompletion(request,response,handler,e);
		
	}
	

}
