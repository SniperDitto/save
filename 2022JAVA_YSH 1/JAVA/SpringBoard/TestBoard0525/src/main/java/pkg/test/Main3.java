package pkg.test;

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
		
		int result[] = {0,0,0};
		for(int i=5;i>0;i--) {
			if(sameNumCounts[i]==3) {
				result[0] = 10000 + (i+1)*1000;
			}
			else if(sameNumCounts[i]==2) {
				result[1] = 1000 + (i+1)*100;
			}
			else if(sameNumCounts[i]==1) {
				result[2] = (i+1)*100;
			}
		}//for문 3번 돌리는거밖에 없나?
		System.out.printf("%d,%d,%d\n",result[0],result[1],result[2]);
		int maxResult = result[0];
		if(result[1]>maxResult) {
			maxResult = result[1];
		}else if(result[2]>maxResult) {
			maxResult = result[2];
		}
		
		System.out.println(maxResult);
		
	}
}
