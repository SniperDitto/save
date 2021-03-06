package Pkg.Client.Menus;

import java.sql.ResultSet;
import java.util.ArrayList;

import Pkg.DB.DBConn;

public class MenuService {
	
	public ArrayList<HmenuVO> getHmenus(){
		ArrayList<HmenuVO> result = new ArrayList<HmenuVO>();
		
		try {
			
			String sql = "{call PKG_MENUS.PROC_SEL_HMENUS(?)}";
			ArrayList<String> params = new ArrayList<String>();
			ResultSet rs = DBConn.select(sql, params, true);
			
			while (rs.next()) {
				HmenuVO h = new HmenuVO();
				h.setMenuID(rs.getString("MENUID"));
				h.setMenuName(rs.getString("MENUNAME"));
				result.add(h);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<LmenuVO> getLmenus(String hMenuID){
		ArrayList<LmenuVO> result = new ArrayList<LmenuVO>();
		
		try {
			String sql = "{call PKG_MENUS.PROC_SEL_LMENUS(?,?)}";
			ArrayList<String> params = new ArrayList<String>();
			params.add(hMenuID);
			
			ResultSet rs = DBConn.select(sql, params, true);
			
			while(rs.next()) {
				LmenuVO l = new LmenuVO();
				l.setlMenuID(rs.getString("LMENUID"));
				l.setlMenuName(rs.getString("LMENUNAME"));
				l.setlMenuURL(rs.getString("LMENUURL"));
				l.setMenuID(rs.getString("MENUID"));
				result.add(l);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<LmenuVO> getLmenusAll(String hMenuID){
		ArrayList<LmenuVO> result = new ArrayList<LmenuVO>();
		
		try {
			String sql = "{call PKG_MENUS.PROC_SEL_LMENUS_ALL(?,?)}";
			ArrayList<String> params = new ArrayList<String>();
			params.add(hMenuID);
			
			ResultSet rs = DBConn.select(sql, params, true);
			
			while(rs.next()) {
				LmenuVO l = new LmenuVO();
				l.setlMenuID(rs.getString("LMENUID"));
				l.setlMenuName(rs.getString("LMENUNAME"));
				l.setlMenuURL(rs.getString("LMENUURL"));
				l.setMenuID(rs.getString("MENUID"));
				result.add(l);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
