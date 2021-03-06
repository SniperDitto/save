package Pkg.Client.Boards;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import Pkg.DB.DBConn;

public class BoardService {
	
	public ArrayList<BoardVO> getBoardList(String idx, String lMenuID){
		ArrayList<BoardVO> result = new ArrayList<BoardVO>();
		
		String sql = "call PKG_REPLY_BOARD.PROC_SEL_BOARDS(?,?,?)";
		ArrayList<String> params = new ArrayList<String>();
		params.add(idx);
		params.add(lMenuID);
		try {
			ResultSet rs = DBConn.select(sql, params, true);
			
			while(rs.next()) {
				BoardVO b = new BoardVO();
				
				b.setIdx(rs.getString("IDX"));
				b.setTitle(rs.getString("TITLE"));
				b.setContent(rs.getString("CONTENT"));
				b.setUserID(rs.getString("USERID"));
				b.setRegnum(rs.getString("REGNUM"));
				b.setLvl(rs.getString("LVL"));
				b.setCombine(rs.getString("COMBINE"));
				b.setVisited(rs.getString("VISITED"));
				b.setRegdate(rs.getString("REGDATE"));
				b.setlMenuID(rs.getString("LMENUID"));
				b.setOrd(rs.getString("ORD"));
				b.setDelnum(rs.getString("DELNUM"));
				
				result.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
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
		
		DBConn.insUpDel(sql, params, true);
	}
	
	public void deleteBoard(BoardVO vo) {
		String sql = "{call PKG_REPLY_BOARD.PROC_DEL_BOARDS(?,?)}";
		ArrayList<String> params = new ArrayList<String>();
		params.add(vo.getIdx());
		params.add(vo.getDelnum());
		
		DBConn.insUpDel(sql, params, true);
	}
	
	public void insertReply(ReplyVO vo) {
		String sql = "{call PKG_REPLY_BOARD.PROC_INS_REPLY(?,?,?)}";
		ArrayList<String> params = new ArrayList<String>();
		params.add();
		params.add();
		
		DBConn.insUpDel(sql, params, true);
	}
	
	
}
