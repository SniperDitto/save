package test;

import java.util.ArrayList;
import java.util.Scanner;

public class Test {
	
	public static void main(String[] args) {
		ArrayList<Integer> result = new ArrayList<Integer>();
		Scanner scanner = new Scanner(System.in);
		int A = Integer.parseInt(scanner.nextLine());
		int B = Integer.parseInt(scanner.nextLine());
		int C = Integer.parseInt(scanner.nextLine());
		
		ArrayList<Integer> nums = new ArrayList<Integer>();
		for(int i=0;i<10;i++) {
			nums.add(i);
			result.add(i, 0);
		}
		
		int mulResult = A*B*C;
		//System.out.println(mulResult);
		
		String strResult = Integer.toString(mulResult);
		for(int num : nums) {
			for(int i=0;i<strResult.length();i++) {
				if(i!=strResult.length()) {
					String chkChar =  strResult.substring(i, i+1);
					int intChk = Integer.parseInt(chkChar);
					if(intChk==num) {
						result.set(num, result.get(num)+1);
					}
				}
			}
			
		}
		
		for(int i : result) {
			System.out.println(i);
		}
		
	}

}
