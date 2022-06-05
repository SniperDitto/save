package pkg.level;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Fibonacci {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int inputNumber = Integer.parseInt(br.readLine());
		int[] prevNums = {0,1};
		int result = 0;
		
		//3번째 이후의 피보나치 수
		for(int i=0;i<inputNumber-1;i++){
			result = prevNums[0]+prevNums[1];
			prevNums[0] = prevNums[1];
			prevNums[1] = result;
		}
		
		if(inputNumber==0) result = 0;
		if(inputNumber==1) result = 1;
		
		System.out.println(result);
	}
	
}
