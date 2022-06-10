package pkg.admin.DAO;

import java.util.ArrayList;
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
	
	public void saveProgramList(ArrayList<ProgramDTO> params) {
		for(ProgramDTO dto : params) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pId", dto.getpID());
			map.put("pName", dto.getpName());
			map.put("menuID", dto.getMenuID());
			map.put("pFileName", dto.getpFileName());
			map.put("fileUrl", dto.getFileUrl());
			
			sqlSession.selectList("saveProgramList",map);
		}
	}
	
	public void delMenuList(ArrayList<ProgramDTO> params) {
		
		for(ProgramDTO dto : params) {
			String pid = dto.getpID();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("delPid", pid);
			
			sqlSession.selectList("delMenuList",map);
		}
		
	}
	
}
