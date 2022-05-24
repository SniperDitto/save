package pkg.Test;

import java.util.Scanner;

public class Main3 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String inString = scanner.nextLine();
		String[] numbers = inString.split(" ");
		int[] diceNums = {1,2,3,4,5,6};
		
		int[] sameNumCounts = {0,0,0,0,0,0};
		for(int i : diceNums) {
			for(int j=0;j<numbers.length;j++) {
				if(i==Integer.parseInt(numbers[j])) {
					sameNumCounts[i-1]++;
				}
				
			}
			
		}
		
		int result = 0;
		int[][] resultList = {{0,0,0,0,0,0},{0,0,0,0,0,0},{0,0,0,0,0,0}};
		for(int i=1;i<4;i++) {
			for(int j=0;j<6;j++) {
				if(sameNumCounts[j]==i) {
					resultList[i-1][j]=i;
				}
				 
				 System.out.println(resultList[i-1][j]);
			}
		}
		
		System.out.println(result);
		
	}
}
