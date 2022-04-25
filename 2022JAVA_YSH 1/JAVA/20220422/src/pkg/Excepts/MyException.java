package pkg.Excepts;

import java.sql.SQLException;
import java.util.ArrayList;

import pkg.DB.DBHandle;

public class MyException extends RuntimeException{
	private String msg;
	public MyException(String msg) {
		super(msg);
		this.msg = msg;
	}
	public MyException(String msg, String methodName, String className) {
		super(msg);
		dbInsert(msg, methodName, className);
	}
	private void setMsg(String msg) {
		System.out.println(msg);
	}
	private void dbInsert(String msg, String methodName, String className) {
		DBHandle db = new DBHandle();
		
		ArrayList<String> params = new ArrayList<String>();
		params.add(msg);
		params.add(className);
		params.add(methodName);
		params.add("USER01");
		
		try {
			db.insert(params);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
