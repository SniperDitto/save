package pkg.boards.DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import oracle.jdbc.OracleTypes;
import pkg.boards.VO.BoardVO;
import pkg.boards.VO.MemberVO;
import pkg.boards.commons.DB.DBConn;

@Component
public class BoardsDAOImpl implements BoardsDAO{

	@Override
	public ArrayList<BoardVO> getBoardsList(String idx) {
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		try {
			Connection dbconn = DBConn.getConnection();
			String sql = "{call PKG_BOARDS.PROC_SEL_BOARDS(?,?)}";
			ArrayList<String> params = new ArrayList<String>();
			params.add(idx);
			
			CallableStatement cs = DBConn.getCallableStatement(dbconn, sql, params);
			cs.registerOutParameter(params.size()+1, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs = (ResultSet) cs.getObject(2);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setIdx(rs.getString("IDX"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setUserID(rs.getString("USERID"));
				boardList.add(vo);
			}
			
			rs.close();rs=null;
			cs.close();cs=null;
			dbconn.close();dbconn=null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boardList;
	}

	@Override
	public ArrayList<MemberVO> getMembers(String userID) {
		ArrayList<MemberVO> userList = new ArrayList<MemberVO>();
		try {
			Connection dbconn = DBConn.getConnection();
			String sql = "{call PKG_BOARDS.PROC_SEL_MEMBERS(?,?)}";
			ArrayList<String> params = new ArrayList<String>();
			params.add(userID);
			
			CallableStatement cs = DBConn.getCallableStatement(dbconn, sql, params);
			cs.registerOutParameter(params.size()+1, OracleTypes.CURSOR);
			cs.executeQuery();
			ResultSet rs = (ResultSet) cs.getObject(2);
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setUserID(rs.getString("USERID"));
				vo.setUserName(rs.getString("USERNAME"));
				userList.add(vo);
			}
			
			rs.close();rs=null;
			cs.close();cs=null;
			dbconn.close();dbconn=null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public void saveBoard(String[] idx, String[] title, String[] userID, String[] status) {
		Connection conn = DBConn.getConnection();
		CallableStatement cs = null;
		try {
			
			String sql = "{call PKG_BOARDS.PROC_SAVE_BOARDS(?,?,?)}";
			
			
			conn.setAutoCommit(false);
			for(int i=0;i<title.length;i++) {
				ArrayList<String> params = new ArrayList<String>();
				//System.out.println("title.length : "+title.length);
				//System.out.printf("idx:%s title:%s userID:%s\n",idx[i],title[i],userID[i]);
				
				if(title.length==1) {
					//??????
					params.add("");
				}else {
					params.add(idx[i]);
				}
				params.add(title[i]);
				params.add(userID[i]);

				cs = DBConn.getCallableStatement(conn, sql, params);
				if(status[i]!=null) {
					cs.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.commit();
				if(cs!=null)cs.close();cs=null;
				conn.close();conn=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void deleteBoard(String[] idx) {
		Connection conn = null;
		CallableStatement cs = null;
		
		try {
			conn = DBConn.getConnection();
			String sql = "{call PKG_BOARDS.PROC_DEL_BOARDS(?)}";
			
			conn.setAutoCommit(false);
			for(int i=0;i<idx.length;i++) {
				ArrayList<String> params = new ArrayList<String>();
				params.add(idx[i]);
				cs = DBConn.getCallableStatement(conn, sql, params);
				cs.executeUpdate();
			}
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.commit();
				if(cs!=null)cs.close();cs=null;
				conn.close();conn=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	}

}
