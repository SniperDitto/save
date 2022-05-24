package test;

import java.util.Scanner;

public class Test3 {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		int inputNum = Integer.parseInt(scanner.nextLine());
		String result = "";
		
		for(int i=1;i<10;i++) {
			System.out.printf("%d * %d = %d\n",inputNum, i, inputNum*i);
		}
		
	}

}
