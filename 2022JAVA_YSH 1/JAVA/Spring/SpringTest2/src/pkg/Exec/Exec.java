package pkg.Exec;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pkg.DAO.BookDAO;
import pkg.DB.OracleDBConn;
import pkg.Service.BookService;
import pkg.VO.BookVO;

public class Exec {

	public static void main(String[] args) {
		
		BookService bs = new BookService();
		BookDAO bDAO = new BookDAO();
		OracleDBConn odb = new OracleDBConn();
		bDAO.setOdb(odb);
		bs.setBookDAO(bDAO);
		ArrayList<BookVO> bookList = bs.getBookList();
		
		//---------------------------------------
		
		ApplicationContext context = new ClassPathXmlApplicationContext("setting.xml");
		BookService bs1 = (BookService) context.getBean("bookService");
		bs1.getBookList();
		
	}

}
