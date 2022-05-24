package pkg.Service;

import java.util.ArrayList;

import pkg.DAO.BookDAO;
import pkg.VO.BookVO;

public class BookService {
	
	private BookDAO bookDAO;
	
	//setter 대신 @Autowired 사용(의존성주입)
	public void setBookDAO(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}
	
	public ArrayList<BookVO> getBookList(){
		ArrayList<BookVO> result = bookDAO.getBookList();
		
		//받아온 데이터에 업무를 추가해 리턴
		System.out.println("asdf");
		
		return result;
	}
	
}
