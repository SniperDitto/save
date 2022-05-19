package pkg.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import oracle.jdbc.OracleTypes;
import pkg.DB.DBConn;

public class TestServiceImpl implements TestService{

	@Override
	public ArrayList<testVO> getTestList(String gbn1, String gbn2) {
		ArrayList<testVO> testList = null;
		Connection conn = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		
		try {
			testList = new ArrayList<testVO>();
			conn = DBConn.getConnection();
			String sql = "{call PKG_TESTTBL.PROC_TESTTBL(?,?,?,?)}";
			ArrayList<String> params = new ArrayList<String>();
			params.add(gbn1);
			params.add(gbn2);
			
			cs = DBConn.getCS(conn, sql, params);
			cs.registerOutParameter(3, OracleTypes.CURSOR);
			cs.registerOutParameter(4, OracleTypes.VARCHAR);
			cs.executeQuery();
			
			rs = (ResultSet)cs.getObject(3);
			String maxGbn2 = (String) cs.getObject(4);
			
			while(rs.next()) {
				testVO vo = new testVO();
				vo.setfID(rs.getString("FID"));
				vo.setfName(rs.getString("FNAME"));
				vo.setGbn1(rs.getString("GBN1"));
				vo.setGbn2(rs.getString("GBN2"));
				vo.setMaxGbn2(maxGbn2);
				
				testList.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();rs=null;
				cs.close();cs=null;
				conn.close();conn=null;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return testList;
	}

	@Override
	public JSONArray getJsonArray(ArrayList<testVO> testList) {
		JSONArray jArray = new JSONArray();
		
		for(testVO vo : testList) {
			Hashtable<String, String> ht = new Hashtable<String, String>();
			ht.put("FID", vo.getfID());
			ht.put("FNAME", vo.getfName());
			
			JSONObject obj = new JSONObject(ht);
			obj.put("FID", vo.getfID());
			obj.put("FNAME", vo.getfName());
			obj.put("GBN1",vo.getGbn1());
			obj.put("GBN2",vo.getGbn2());
			obj.put("MAXGBN2", vo.getMaxGbn2());
			
			jArray.add(obj);
		}
		
		return jArray;
	}


}
