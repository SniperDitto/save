package pkg.books.DAO;

import java.util.ArrayList;

import pkg.DB.MSSqlDBConn;
import pkg.DB.MySqlDBConn;
import pkg.books.VO.BookVO;

public class Yes24BookDAOImpl implements BookDAO{
	private MSSqlDBConn msdb;
	private MySqlDBConn mydb;
	
	public void setMsdb(MSSqlDBConn msdb) {
		this.msdb = msdb;
	}
	public void setMydb(MySqlDBConn mydb) {
		this.mydb = mydb;
	}
	
	@Override
	public ArrayList<BookVO> getBookList() {
		ArrayList<BookVO> result = new ArrayList<BookVO>();
		
		//mssql
		String strMSResult = msdb.getDBConn();
		System.out.println(strMSResult);
		
		//mysql
		String strMyResult = mydb.getDBConn();
		System.out.println(strMyResult);
		
		//두 데이터 조합
		BookVO vo = new BookVO();
		vo.setBookID("B001");
		vo.setBookName("데미안");
		vo.setBookPrice(10000);
		result.add(vo);
		
		return result;
	}

}
