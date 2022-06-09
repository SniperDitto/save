package pkg.admin.DAO;

import java.util.ArrayList;
import java.util.List;

import pkg.admin.DTO.ProgramDTO;

public interface ProgramDAO {
	public List<ProgramDTO> getProgramList(String pName);
	public void saveProgramList(ArrayList<ProgramDTO> params);
}
