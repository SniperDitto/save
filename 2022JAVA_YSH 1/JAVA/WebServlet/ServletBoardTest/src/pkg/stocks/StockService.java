package pkg.stocks;

import java.util.ArrayList;

import pkg.stocks.VO.StockVO;

public interface StockService {
	public ArrayList<StockVO> getList(String sid);
	public void insertStock(StockVO vo);
	public void updateStock(StockVO vo);
	public void deleteStock(String sid);
	public ArrayList<StockVO> selectStock(String sid);
}
