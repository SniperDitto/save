package pkg.test;

import java.sql.Connection;

import pkg.except.MyException;

public class Test {
	
	public void run(int i) {
		//a가 100보다 큰 값이 들어오면 오류발생
		if(i<100) {
			System.out.println("옼케이.");
		}else {
			//throw new MyException("100보다 작은 수만 입력");
			Connection conn = null;
			conn.toString();//NullPointerException 발생
			//에러 처리를 하는 방법 선택 - 메서드 자체에 throws || 메서드 사용자쪽에서 try/catch
		}
		
		
	}
	
	
	
	
}
