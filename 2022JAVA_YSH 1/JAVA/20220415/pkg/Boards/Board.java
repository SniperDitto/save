package pkg.Boards;

import java.sql.ResultSet;
import java.util.Scanner;

import pkg.DB.DBHandle;
import pkg.DB.DBUse;
import pkg.DB.DBinfo;
import pkg.DB.QueryKind;

public class Board {
	
	private String title;
	private DBHandle dbHandle;
	private DBUse dbUse;
	
	
	public Board() {
		this.dbHandle = new DBHandle(DBinfo.url, DBinfo.id, DBinfo.pw);
		this.dbUse = new DBUse();
	}
	
	private void boardUI() {
		Scanner s = new Scanner(System.in);
		System.out.print("글제목 : ");
		this.title = s.nextLine();

	}
	
	public void boardWrite(User user) {
		
		boolean isUserLogin = user.getIsLogin();

		if(isUserLogin) {
			boardUI();
			String sql = "{CALL PKG_BOARD.PROC_INS_BOARD(?,?)}";
			String[] params = new String[2];
			params[0]=this.title;
			params[1]=user.getUserID();
			
			dbHandle.dbManage(sql, params, QueryKind.procedure);
			boardList();
		}
		else {
			System.out.println("로그인 필요");
			//user.login();
		}
		
		
	}
	
	
	public void boardList() {
		System.out.println();
		String sql = "{CALL PKG_BOARD.PROC_SEL_BOARD(?,?,?)}";
		String[] params = new String[2];
		Scanner s = new Scanner(System.in);
		params[0]="";
		params[1]="";
		ResultSet rs = this.dbHandle.dbSelect(sql, params, QueryKind.procedure, true);
		
		String sIDX="";
		String sTitle="";
		String sUsername="";
		String sRegdate="0";
		
		try {
			System.out.println("글번호\t글제목\t\t작성자\t작성일");
			while(rs.next()) {
				sIDX = rs.getNString("IDX");
				sTitle = rs.getNString("TITLE");
				sUsername = rs.getNString("USERNAME");
				sRegdate  = rs.getNString("REGDATE");
				System.out.println(sIDX+"\t"+sTitle+"\t\t"+sUsername+"\t"+sRegdate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//System.out.println("완.");
		}
	}
	
	public void boardList(String idx, String title) {
		System.out.println();
		String sql = "{CALL PKG_BOARD.PROC_SEL_BOARD(?,?,?)}";
		String[] params = new String[2];
		params[0]=idx;
		params[1]=title;
		ResultSet rs = this.dbHandle.dbSelect(sql, params, QueryKind.procedure, true);
		
		String sIDX="";
		String sTitle="";
		String sUsername="";
		String sRegdate="";
		
		try {
			System.out.println("글번호\t글제목\t\t작성자\t작성일");
			while(rs.next()) {
				sIDX = rs.getNString("IDX");
				sTitle = rs.getNString("TITLE");
				sUsername = rs.getNString("USERNAME");
				sRegdate  = rs.getNString("REGDATE");
				System.out.println(sIDX+"\t"+sTitle+"\t\t"+sUsername+"\t"+sRegdate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//System.out.println("완.");
		}
	}
	
	public void boardList2() {
		System.out.println();
		String sql = "{CALL PKG_BOARD.PROC_SEL_BOARD(?,?,?)}";
		String[] params = new String[2];
		Scanner s = new Scanner(System.in);
		params[0]="";
		params[1]="";
		this.dbUse.setQK(QueryKind.procedure);
		ResultSet rs = this.dbUse.dbSel(sql, params, true);
		
		String sIDX="";
		String sTitle="";
		String sUsername="";
		String sRegdate="0";
		
		try {
			System.out.println("글번호\t글제목\t\t작성자\t작성일");
			while(rs.next()) {
				sIDX = rs.getNString("IDX");
				sTitle = rs.getNString("TITLE");
				sUsername = rs.getNString("USERNAME");
				sRegdate  = rs.getNString("REGDATE");
				System.out.println(sIDX+"\t"+sTitle+"\t\t"+sUsername+"\t"+sRegdate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//System.out.println("완.");
		}
	}
	
}
