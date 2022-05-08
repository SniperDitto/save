package pkg.test;

import pkg.Excepts.MyException;

public class Test {
	
	
	public void run(int i){
		try {
			if(i<100) {
				System.out.println(i);
			}else{
				throw new MyException("over 100", "Test", "run()");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
}
