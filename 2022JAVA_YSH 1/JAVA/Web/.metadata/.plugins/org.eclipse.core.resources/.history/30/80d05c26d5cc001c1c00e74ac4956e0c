package Pkg.Client.Boards;

import java.util.ArrayList;

public class BoardService {
	
	public void insertBoard(BoardVO vo) {
		String sql = "{call PKG_REPLY_BOARD.PROC_INS_BOARDS(?,?,?,?,?,?,?,?,?)}";
		ArrayList<String> params = new ArrayList<String>();
		params.add(vo.getIdx());
		params.add(vo.getTitle());
		params.add(vo.getContent());
		params.add(vo.getUserID());
		params.add(vo.getRegnum());
		params.add(vo.getLvl());
		params.add(vo.getCombine());
		params.add(vo.getlMenuID());
		params.add(vo.getOrd());
		
	}
	
	
}
