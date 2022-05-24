package pkg.service;

import java.util.ArrayList;

import pkg.DB.MSSqlDBConn;
import pkg.DB.MySqlDBConn;
import pkg.books.DAO.Yes24BookDAOImpl;
import pkg.books.VO.BookVO;

public class yes24ServiceImpl implements BookService{
	
	@Override
	public ArrayList<BookVO> getBookList(int priceOff){
		Yes24BookDAOImpl yes24DAO = new Yes24BookDAOImpl();
		
		MSSqlDBConn msdb = new MSSqlDBConn();
		MySqlDBConn mydb = new MySqlDBConn();
		
		yes24DAO.setMsdb(msdb);
		yes24DAO.setMydb(mydb);;
		
		ArrayList<BookVO> bookList = yes24DAO.getBookList();
		
		for(BookVO vo : bookList) {
			vo.setBookPrice(vo.getBookPrice()-priceOff);
		}
		
		
		return bookList;
	}
	
	
}
