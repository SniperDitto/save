package pkg.Service;

import java.util.ArrayList;

import pkg.DAO.StockDAO;
import pkg.VO.StockVO;

public class StockServiceImpl implements StockService{
	
	private StockDAO stockDAO;
	
	public void setStockDAO(StockDAO stockDAO) {
		this.stockDAO = stockDAO;
	}

	@Override
	public void printStockList(String sID) {
		ArrayList<StockVO> stockList = stockDAO.getStockList(sID);
		
		for(StockVO vo : stockList) {
			System.out.printf("id : %s / 이름 : %s / 내용 : %s /\n",vo.getsID(), vo.getsName(), vo.getsInfo());
		}
		
	}
	
}
