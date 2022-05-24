package pkg.DAO;

import java.util.ArrayList;

import pkg.VO.StockVO;

public interface StockDAO {
	public ArrayList<StockVO> getStockList(String sID);
}
