package pkg.admin.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pkg.admin.DTO.ProgramDTO;

@Repository
public class ProgramDAOImpl implements ProgramDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<ProgramDTO> getProgramList(String pName){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pName", pName);
		
		sqlSession.selectList("selectProgramList",map);
		List<ProgramDTO> programList = (List<ProgramDTO>) map.get("result");
		
		return programList;
	};
	
}
