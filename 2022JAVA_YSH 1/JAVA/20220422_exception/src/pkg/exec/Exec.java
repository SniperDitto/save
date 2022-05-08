package pkg.exec;

import pkg.except.MyException;
import pkg.test.Test;

public class Exec {

	public static void main(String[] args) {
		
		try {
			Test t = new Test();
			t.run(12);
			t.run(123123);
		}
		catch (MyException e) {
			System.out.println(e.getMessage());
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		
	}

}
