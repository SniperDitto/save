package pkg.service;

import java.util.ArrayList;

import pkg.books.VO.BookVO;

public interface BookService {
	public ArrayList<BookVO> getBookList(int priceOff);
}
