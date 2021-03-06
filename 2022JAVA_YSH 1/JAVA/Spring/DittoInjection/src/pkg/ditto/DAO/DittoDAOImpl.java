package pkg.ditto.DAO;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pkg.ditto.DB.DBConn;
import pkg.ditto.VO.DittoVO;

@Component
public class DittoDAOImpl implements DittoDAO{
	
	@Autowired
	private DBConn dbConn;
	
	@Override
	public ArrayList<DittoVO> getDittoData() {
		ArrayList<DittoVO> result = new ArrayList<DittoVO>();
		
		//DB에서 가져왔다고 가정
		DittoVO vo1 = new DittoVO();
		vo1.setdID("D01");
		vo1.setdName("몽짱");
		vo1.setdAge(4);
		result.add(vo1);
		
		DittoVO vo2 = new DittoVO();
		vo2.setdID("D02");
		vo2.setdName("마쉬");
		vo2.setdAge(1);
		result.add(vo2);
		
		return result;
	}
	
}
