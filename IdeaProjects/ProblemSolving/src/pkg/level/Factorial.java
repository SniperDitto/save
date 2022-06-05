package pkg.level;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Factorial {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int inputNum = Integer.parseInt(br.readLine());
		
		System.out.println(getFactorial(inputNum));
	}
	
	public static int getFactorial(int num){
		if(num>=2){
			return num * getFactorial(num-1);
		}else if(num<=1){
			return 1;
		}
		
		return 1;
	}
}
