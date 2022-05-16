package pkg.stock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pkg.stocks.StockService;
import pkg.stocks.StockServiceImpl;
import pkg.stocks.VO.StockVO;


@WebServlet("/StockController")
public class StockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public StockController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String jspURL = request.getParameter("jspURL");
		if(jspURL.equals("list")) {
			handleList(request, response);
		}else if(jspURL.equals("add")) {
			addList(request, response);
		}
	} 


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void handleList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StockService ss = new StockServiceImpl();
		ArrayList<StockVO> stockList = ss.getList();
		
		request.setAttribute("stockList", stockList);
		
		RequestDispatcher d = request.getRequestDispatcher("/view/list.jsp");
		d.forward(request, response);
	}
	

	private void addList(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
}
