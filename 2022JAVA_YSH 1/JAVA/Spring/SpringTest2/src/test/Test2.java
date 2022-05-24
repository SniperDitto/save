package test;

import java.util.Scanner;

public class Test2 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String inString = scanner.nextLine();
		int addTime = Integer.parseInt(scanner.nextLine());
		
		int hourNow = Integer.parseInt(inString.split(" ")[0]);
		int minNow = Integer.parseInt(inString.split(" ")[1]);
		
		int hourResult = hourNow;
		int minResult = minNow+addTime;
		
		while(minResult>=60) {
			hourResult++;
			minResult-=60;
			if(hourResult>23) {
				hourResult=0;
			}
		}
		
		String result = Integer.toString(hourResult) + " " + Integer.toString(minResult);

		
		System.out.println(result);
	}
}
