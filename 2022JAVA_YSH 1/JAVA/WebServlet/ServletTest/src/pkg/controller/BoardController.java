package pkg.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pkg.service.BoardService;
import pkg.service.BoardServiceImpl;

@WebServlet("/BoardController")
public class BoardController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	public BoardController() {
		super();
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		
		BoardService bs = new BoardServiceImpl();
		
		ArrayList<String> boards = bs.getBoardList();
		
		RequestDispatcher d = req.getRequestDispatcher("./view/board.jsp");
		req.setAttribute("boardList", boards);
		
		d.forward(req, res);
	}
	
}
