package pkg.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pkg.DB.OracleDBConn;
import pkg.VO.StockVO;

public class StockDAOImpl implements StockDAO{
	
	//db가 여러 종류인 경우 속성을 인터페이스 타입으로 선언한다
	private OracleDBConn oDBConn;
	
	public void setODBConn(OracleDBConn oDBConn) {
		this.oDBConn = oDBConn;
	}

	@Override
	public ArrayList<StockVO> getStockList(String sID) {
		ArrayList<StockVO> result = new ArrayList<StockVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM STOCK WHERE SID LIKE '%'||?||'%'";
			ArrayList<String> params = new ArrayList<String>();
			params.add(sID);
			
			conn = oDBConn.getConnection();
			ps = oDBConn.getPreparedStatement(conn, sql, params);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StockVO vo = new StockVO();
				vo.setsID(rs.getString("SID"));
				vo.setsName(rs.getString("SNAME"));
				vo.setsInfo(rs.getString("SINFO"));
				
				result.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close(); rs = null;
				ps.close(); ps = null;
				conn.close(); conn = null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

}
