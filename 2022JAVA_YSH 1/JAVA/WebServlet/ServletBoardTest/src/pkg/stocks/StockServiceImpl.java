package pkg.stocks;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pkg.DB.DBConn;
import pkg.stocks.VO.StockVO;

public class StockServiceImpl implements StockService{

	@Override
	public ArrayList<StockVO> getList(String sid) {
		ArrayList<StockVO> result = null;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
				
		try {
			conn = DBConn.getConnection();
			
			String sql = "SELECT * FROM STOCK WHERE TRIM(SID) LIKE '%'||TRIM(?)||'%' ";
			ArrayList<String> params = new ArrayList<String>();
			params.add(sid);
			
			ps = DBConn.getPS(conn, sql, params);
			
			rs = ps.executeQuery();
			result = new ArrayList<StockVO>();
			
			while (rs.next()) {
				StockVO vo = new StockVO();
				vo.setSID(rs.getString("SID"));
				vo.setSName(rs.getString("SNAME"));
				vo.setSInfo(rs.getString("SINFO"));
				
				result.add(vo);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();rs=null;
				ps.close();ps=null;
				conn.close();conn=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

	@Override
	public void insertStock(StockVO vo) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn=DBConn.getConnection();
			
			String sql = "INSERT INTO STOCK(SID, SNAME, SINFO) VALUES(TRIM(?),?,?)";
			ArrayList<String> params = new ArrayList<String>();
			params.add(vo.getSID());
			params.add(vo.getSName());
			params.add(vo.getSInfo());
			
			ps=DBConn.getPS(conn, sql, params);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();ps=null;
				conn.close();conn=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void updateStock(StockVO vo) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn=DBConn.getConnection();
			
			String sql = "UPDATE STOCK SET SNAME=?, SINFO=? WHERE TRIM(SID)=TRIM(?)";
			ArrayList<String> params = new ArrayList<String>();
			params.add(vo.getSName());
			params.add(vo.getSInfo());
			params.add(vo.getSID());
			
			ps=DBConn.getPS(conn, sql, params);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();ps=null;
				conn.close();conn=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void deleteStock(String sid) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn=DBConn.getConnection();
			
			String sql = "DELETE FROM STOCK WHERE TRIM(SID)=TRIM(?)";
			ArrayList<String> params = new ArrayList<String>();
			params.add(sid);
			
			ps=DBConn.getPS(conn, sql, params);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();ps=null;
				conn.close();conn=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Override
	public ArrayList<StockVO> selectStock(String sid) {
		ArrayList<StockVO> result = new ArrayList<StockVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBConn.getConnection();
			String sql = "SELECT * FROM STOCK WHERE TRIM(SID)=TRIM(?)";
			ArrayList<String> params = new ArrayList<String>();
			params.add(sid);
			
			System.out.println(sid+" added");
			
			ps = DBConn.getPS(conn, sql, params);
			rs = ps.executeQuery();
			
			
			while (rs.next()) {
				
				StockVO vo = new StockVO();
				vo.setSID(rs.getString("SID"));
				vo.setSName(rs.getString("SNAME"));
				vo.setSInfo(rs.getString("SINFO"));
				
				System.out.println("rs:"+rs.getString("SID"));
				
				result.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();rs=null;
				ps.close();ps=null;
				conn.close();conn=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	
}
