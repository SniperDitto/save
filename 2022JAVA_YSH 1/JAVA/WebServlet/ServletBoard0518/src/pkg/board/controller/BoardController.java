package pkg.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;




@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BoardController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String url = request.getParameter("url");
		if(url.equals("list")) {
			getBoardList(request, response);
		} else if(url.equals("write")) {
			getWritePage(request, response);
		} else if(url.equals("writeOK")) {
			addBoard(request, response);
		} else if(url.equals("content")) {
			getContent(request, response);
		} else if(url.equals("update")) {
			getUpdatePage(request, response);
		} else if(url.equals("updateOK")) {
			updateBoard(request, response);
		} else if(url.equals("delete")) {
			deleteBoard(request, response);
		}
	}


	protected void deleteBoard(HttpServletRequest request, HttpServletResponse response) {
		
	}


	protected void updateBoard(HttpServletRequest request, HttpServletResponse response) {
		
	}


	protected void getUpdatePage(HttpServletRequest request, HttpServletResponse response) {
		
	}


	protected void getContent(HttpServletRequest request, HttpServletResponse response) {
		
	}


	protected void addBoard(HttpServletRequest request, HttpServletResponse response) {
		
	}


	protected void getWritePage(HttpServletRequest request, HttpServletResponse response) {
		
	}


	protected void getBoardList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("list");
		
		JSONArray jArray = new JSONArray();
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
