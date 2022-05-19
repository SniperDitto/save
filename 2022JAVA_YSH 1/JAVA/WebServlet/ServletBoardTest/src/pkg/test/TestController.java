package pkg.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;


@WebServlet("/TestController")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String strURL = request.getParameter("strURL");
		
		if(strURL==null) {
			showList(request, response);
		} else {
			getAList(request, response);
		} 
		

		
		
	}

	private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("showList");
		
		String gbn2_A = request.getParameter("gbn2_A");
		String gbn2_B = request.getParameter("gbn2_B");
		String gbn2_C = request.getParameter("gbn2_C");
		String gbn2_D = request.getParameter("gbn2_D");
		
		if (gbn2_A==null) gbn2_A = "1";
		if (gbn2_B==null) gbn2_B = "1";
		if (gbn2_C==null) gbn2_C = "1";
		if (gbn2_D==null) gbn2_D = "1";
		
		TestService ts = new TestServiceImpl();
		ArrayList<testVO> arrA = ts.getTestList("A", gbn2_A);
		ArrayList<testVO> arrB = ts.getTestList("B", gbn2_B);
		ArrayList<testVO> arrC = ts.getTestList("C", gbn2_C);
		ArrayList<testVO> arrD = ts.getTestList("D", gbn2_D);
		
		request.setAttribute("listA", arrA);
		request.setAttribute("listB", arrB);
		request.setAttribute("listC", arrC);
		request.setAttribute("listD", arrD);
		request.setAttribute("gbn2_A", gbn2_A);
		request.setAttribute("gbn2_B", gbn2_B);
		request.setAttribute("gbn2_C", gbn2_C);
		request.setAttribute("gbn2_D", gbn2_D);
		
		RequestDispatcher d = request.getRequestDispatcher("/test/test.jsp");
		d.forward(request, response);
	}

	protected void getAList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("AList");
		
		String gbn1 = request.getParameter("strURL");
		String gbn2 = request.getParameter("gbn2");
		
		if(gbn1.equals("A")) {
			request.setAttribute("gbn2_A", gbn2);
		} else if(gbn1.equals("B")) {
			request.setAttribute("gbn2_B", gbn2);
		} else if(gbn1.equals("C")) {
			request.setAttribute("gbn2_C", gbn2);
		} else if(gbn1.equals("D")) {
			request.setAttribute("gbn2_D", gbn2);
		}
		
		System.out.printf("gbn1 : %s / gbn2 : %s\n", gbn1, gbn2);
		
		TestService ts = new TestServiceImpl();
		ArrayList<testVO> arrA = ts.getTestList(gbn1, gbn2);
		JSONArray jArray = ts.getJsonArray(arrA);
		
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println(jArray);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
