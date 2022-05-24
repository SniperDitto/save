package pkg.service;

import java.util.ArrayList;

import pkg.DB.MSSqlDBConn;
import pkg.DB.OracleDBConn;
import pkg.books.DAO.AladinBookDAOImpl;
import pkg.books.DAO.BookDAO;
import pkg.books.VO.BookVO;

public class AladinServiceImpl implements BookService{
	
	@Override
	public ArrayList<BookVO> getBookList(int priceOff){
		BookDAO aladinDAO = new AladinBookDAOImpl();
		
		MSSqlDBConn msdb = new MSSqlDBConn();
		OracleDBConn odb = new OracleDBConn();
		
		((AladinBookDAOImpl) aladinDAO).setMsdb(msdb);
		((AladinBookDAOImpl) aladinDAO).setOdb(odb);
		
		ArrayList<BookVO> bookList = aladinDAO.getBookList();
		
		for(BookVO vo : bookList) {
			vo.setBookPrice(vo.getBookPrice()-priceOff);
		}
		
		
		return bookList;
	}
}
