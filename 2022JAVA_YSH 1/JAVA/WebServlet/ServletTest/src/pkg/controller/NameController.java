package pkg.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pkg.service.NameService;
import pkg.service.SportsService;
import pkg.service.SportsServiceImpl;

@WebServlet("/NameController")
public class NameController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
        
    public NameController() {
        super();
    }
    
    //get방식
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		
		NameService ns = new NameService();
		SportsService ss = new SportsServiceImpl();
		
		ArrayList<String> names = ns.getNames();
		ArrayList<String> sports = ss.getSports();
		
		System.out.println(names);
		System.out.println(sports);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./view/name.jsp");
		
		request.setAttribute("nameList", names);
		request.setAttribute("sportsList", sports);

		
		dispatcher.forward(request, response);
		
		
	}
	
	//post방식
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	
	
	
}
