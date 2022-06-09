package pkg.admin.Service;

import java.util.ArrayList;
import java.util.List;

import pkg.admin.DTO.ProgramDTO;

public interface ProgramService {
	public List<ProgramDTO> getProgramList(String pName);
	public void saveProgramList(ArrayList<ProgramDTO> params);
}
