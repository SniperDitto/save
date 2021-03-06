package pkg.books.DAO;

import java.util.ArrayList;

import pkg.DB.MSSqlDBConn;
import pkg.DB.OracleDBConn;
import pkg.books.VO.BookVO;

public class AladinBookDAOImpl implements BookDAO{
	private OracleDBConn odb;
	private MSSqlDBConn msdb;
	
	public AladinBookDAOImpl() {
		this.odb = new OracleDBConn();
		this.msdb = new MSSqlDBConn();
	}
	
	public void setOdb(OracleDBConn odb) {
		this.odb = odb;
	}
	public void setMsdb(MSSqlDBConn msdb) {
		this.msdb = msdb;
	}


	//oracle, MSSQL
	public ArrayList<BookVO> getBookList(){
		ArrayList<BookVO> result = new ArrayList<BookVO>();
		
		//oracle
		String strOResult = odb.getDBConn();
		System.out.println(strOResult);
		
		//mssql
		String strMSResult = msdb.getDBConn();
		System.out.println(strMSResult);
		
		//두 데이터 조합
		BookVO vo = new BookVO();
		vo.setBookID("B002");
		vo.setBookName("달마야놀자");
		vo.setBookPrice(10000);
		result.add(vo);
		
		return result;
	}
}
