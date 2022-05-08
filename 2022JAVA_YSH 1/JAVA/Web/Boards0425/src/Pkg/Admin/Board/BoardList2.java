package Pkg.Admin.Board;

import java.sql.ResultSet;
import java.util.ArrayList;

import Pkg.DB.DBConn;

public class BoardList2 {
	
	public ArrayList<BoardVO2> getBoardList(){
		ArrayList<BoardVO2> result = new ArrayList<BoardVO2>();
		
		String sql = "{call PKG_BOARDS.PROC_SEL_BOARD(?,?)}";
		ArrayList<String> params = new ArrayList<String>();
		params.add("");
		
		try {
			ResultSet rs = DBConn.select(sql, params, true);
			
			while (rs.next()) {
				BoardVO2 vo = new BoardVO2();
				vo.setIdx(rs.getString("IDX"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setContent(rs.getString("CONTENT"));
				vo.setUserID(rs.getString("USERID"));
				vo.setRegdate(rs.getString("REGDATES"));
				
				result.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public void deleteBoard(String[] idxs) {
		String sql = "{call PKG_BOARDS.PROC_DEL_BOARD(?)}";
		ArrayList<String> params = new ArrayList<String>();
		
		try {
			for (int i = 0; i < idxs.length; i++) {
				params.add(idxs[i]);
				DBConn.insUpDel(sql, params, true);
				params.clear();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
