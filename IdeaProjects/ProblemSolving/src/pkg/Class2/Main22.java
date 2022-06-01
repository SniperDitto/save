package pkg.Class2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main22 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] inputStr = br.readLine().split(" ");
		int[] inputNum = new int[4];
		int[] compareArr = new int[4];
		
		for(int i=0;i<4;i++){
			inputNum[i] = Integer.parseInt(inputStr[i]);
		}
		compareArr[0] = Math.abs(inputNum[3]-inputNum[1]);//h-y
		compareArr[1] = Math.abs(inputNum[1]);//y
		compareArr[2] = Math.abs(inputNum[0]);//x
		compareArr[3] = Math.abs(inputNum[2]-inputNum[0]);//w-x
		
		int minVal = compareArr[0];
		for(int i=0;i<4;i++){
			if(minVal>compareArr[i]){
				minVal = compareArr[i];
			}
		}
		System.out.println(minVal);
	}
}
