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
			showList(request, response);
		}else if(jspURL.equals("write")) {
			addPage(request, response);
		}else if(jspURL.equals("writeOK")) {
			addList(request, response);
		}else if(jspURL.equals("content")) {
			showContent(request, response);
		}else if(jspURL.equals("delete")) {
			delList(request, response);
		}else if(jspURL.equals("update")) {
			updatePage(request, response);
		}else if(jspURL.equals("updateOK")) {
			updateList(request, response);
		}
	} 


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("list");
		
		StockService ss = new StockServiceImpl();
		ArrayList<StockVO> stockList = ss.getList("");
		
		request.setAttribute("stockList", stockList);
		
		RequestDispatcher d = request.getRequestDispatcher("/view/list.jsp");
		d.forward(request, response);
	}
	

	private void addPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("write");
		
		RequestDispatcher d = request.getRequestDispatcher("/view/write.jsp");
		d.forward(request, response);
		
	}
	
	private void addList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("writeOK");
		
		String sID = request.getParameter("sid");
		String sName = request.getParameter("sname");
		String sInfo = request.getParameter("sinfo");
		
		StockVO vo = new StockVO();
		vo.setSID(sID);
		vo.setSName(sName);
		vo.setSInfo(sInfo);
		
		StockService ss = new StockServiceImpl();
		ss.insertStock(vo);
		
		showList(request, response);
		
	}
	
	protected void showContent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("content");
		
		StockService ss = new StockServiceImpl();
		String sID = request.getParameter("sid");
		
		ArrayList<StockVO> stocks = ss.selectStock(sID);
		
		if(stocks.size()!=0) {
			StockVO vo = stocks.get(0);
			request.setAttribute("stock", vo);
		}
		
		RequestDispatcher d = request.getRequestDispatcher("/view/content.jsp");
		d.forward(request, response);
	}
	
	private void delList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("delete");
		
		String sID = request.getParameter("sid");
		StockService ss = new StockServiceImpl();
		
		ss.deleteStock(sID);
		
		showList(request, response);
	}
	
	
	private void updatePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("update");
		
		StockService ss = new StockServiceImpl();
		String sID = request.getParameter("sid");
		
		ArrayList<StockVO> stocks = ss.selectStock(sID);
		if(stocks.size()!=0) {
			StockVO vo = stocks.get(0);
			request.setAttribute("stock", vo);
		}
		
		RequestDispatcher d = request.getRequestDispatcher("/view/update.jsp");
		d.forward(request, response);
		
	}
	
	private void updateList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("updateOK");
		
		String sID = request.getParameter("sid");
		String sName = request.getParameter("sname");
		String sInfo = request.getParameter("sinfo");
		
		StockVO vo = new StockVO();
		vo.setSID(sID);
		vo.setSName(sName);
		vo.setSInfo(sInfo);
		
		StockService ss = new StockServiceImpl();
		ss.updateStock(vo);
		
		showContent(request, response);
		
	}
	
}
