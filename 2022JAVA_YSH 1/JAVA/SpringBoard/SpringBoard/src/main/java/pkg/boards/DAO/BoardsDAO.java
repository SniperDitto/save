package pkg.boards.DAO;

import java.util.ArrayList;

import pkg.boards.VO.BoardVO;
import pkg.boards.VO.MemberVO;

public interface BoardsDAO {
	public ArrayList<BoardVO> getBoardsList(String idx);
	public ArrayList<MemberVO> getMembers(String userID);
	public void saveBoard(String[] idx, String[] title, String[] userID, String[] status);
}
