package Pkg.Member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Pkg.DB.DBConn;

//Member 관련 업무처리클래스
public class MemberService {
	
	//1. 중복검사 + db저장
	public boolean memberJoin(MemberVO member) {
		boolean isDuplicate = false;//중복없다면
		try {
			//중복검사
			String sql="{call PKG_MEMBERS.PROC_CHK_USERID(?,?)}";
			ArrayList<String> params=new ArrayList<String>();
			params.add(member.getUserID());
			
			ResultSet result = DBConn.select(sql, params, true);
			
			result.next();
			String strCnt = result.getString("CNT");
			if(!strCnt.equals("0")) {
				isDuplicate = true;//아이디중복됨
			}else {
				String sql2="{call PKG_MEMBERS.PROC_INS_USER(?,?,?)}";
				ArrayList<String> params2=new ArrayList<String>();
				params2.add(member.getUserID());
				params2.add(member.getUserPass());
				params2.add(member.getUserName());
				
				DBConn.insUpDel(sql2, params2, true);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isDuplicate;
	}
	
	public boolean joinMember(MemberVO member) {
		//아이디중복확인 + 회원저장
		boolean isOK = false;
		try {
			String sql="{call PKG_MEMBERS.PROC_JOIN_USER(?,?,?,?,?,?)}";
			ArrayList<String> params = new ArrayList<String>();
			
			String strHobbies="";
			for(String s : member.getUserHobby()){
				strHobbies += s + " ";
			}
			params.add(member.getUserID());
			params.add(member.getUserPass());
			params.add(member.getUserName());
			params.add(member.getUserGen());
			params.add(strHobbies);
			
			ResultSet result = DBConn.select(sql, params, true);
			
			result.next();
			isOK = result.getString("V_OK").equals("true")? true : false;
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return isOK;
	}
	
}
