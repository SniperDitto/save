package pkg.admin.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pkg.admin.DAO.ProgramDAO;
import pkg.admin.DTO.ProgramDTO;

@Service
public class ProgramServiceImpl implements ProgramService{
	
	private final ProgramDAO programDAO;
	
	@Autowired
	public ProgramServiceImpl(ProgramDAO programDAO) {
		this.programDAO = programDAO;
	}
	
	@Override
	public List<ProgramDTO> getProgramList(String pName) {
		
		return programDAO.getProgramList(pName);
	}
	
	public void saveProgramList(ArrayList<ProgramDTO> params) {
		programDAO.saveProgramList(params);
	}

}
