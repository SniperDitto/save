package pkg.Exec;

import java.util.ArrayList;

import pkg.books.VO.BookVO;
import pkg.service.AladinServiceImpl;
import pkg.service.BookService;
import pkg.service.yes24ServiceImpl;

public class Exec {

	public static void main(String[] args) {
		
		BookService bookService1 = new AladinServiceImpl();
		BookService bookService2 = new yes24ServiceImpl();
		ArrayList<BookVO> bookList = bookService1.getBookList(2000);
		
		for(BookVO vo : bookList) {
			System.out.println("ID : "+vo.getBookID());
			System.out.println("제목 : "+vo.getBookName());
			System.out.println("가격 : "+vo.getBookPrice());
		}
		
		
		

		
	}

}
