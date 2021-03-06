package pkg.ditto.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pkg.ditto.DAO.DittoDAO;
import pkg.ditto.VO.DittoVO;

@Component("dittoServiceImpl")
public class DittoServiceImpl implements DittoService{
	
	@Autowired
	private DittoDAO dittoDAO;
	
	@Override
	public void printDittoInfo(String dID) {
		ArrayList<DittoVO> dittoList = dittoDAO.getDittoData();
		if(dID.equals("")) {
			for(DittoVO vo : dittoList) {
				System.out.println("-----");
				System.out.printf("ID : %s\n",vo.getdID());
				System.out.printf("이름 : %s\n",vo.getdName());
				System.out.printf("나이 : %s살\n",vo.getdAge());
				System.out.println("-----");
			}
		}else {
			for(DittoVO vo : dittoList) {
				if(vo.getdID().equals(dID)) {
					System.out.println("-----");
					System.out.printf("ID : %s\n",vo.getdID());
					System.out.printf("이름 : %s\n",vo.getdName());
					System.out.printf("나이 : %s살\n",vo.getdAge());
					System.out.println("-----");
				}
			}
		}
		
		
	}

}
