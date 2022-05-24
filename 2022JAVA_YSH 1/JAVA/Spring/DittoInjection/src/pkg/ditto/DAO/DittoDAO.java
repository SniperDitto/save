package pkg.ditto.DAO;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import pkg.ditto.VO.DittoVO;

@Component
public interface DittoDAO {
	
	public ArrayList<DittoVO> getDittoData();
	
}
