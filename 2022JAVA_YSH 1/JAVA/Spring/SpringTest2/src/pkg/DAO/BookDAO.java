package pkg.DAO;

import java.util.ArrayList;

import pkg.DB.OracleDBConn;
import pkg.VO.BookVO;

public class BookDAO {
	
	private OracleDBConn odb;
	
	public void setOdb(OracleDBConn odb) {
		this.odb = odb;
	}

	public ArrayList<BookVO> getBookList(){
		ArrayList<BookVO> result = new ArrayList<BookVO>();
		//1. db연결
		String odbS = odb.getDBConn();
		System.out.println(odbS);
		
		BookVO vo = new BookVO();
		vo.setBookID("B001");
		vo.setBookName("책1");
		vo.setBookPrice(5000);
		result.add(vo);
		
		return result;
	}
}
