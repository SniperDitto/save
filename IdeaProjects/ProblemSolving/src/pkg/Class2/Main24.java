package pkg.Class2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Main24 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] stopArr = {"0","0","0"};
		
		while (true){
			String[] inputStr = br.readLine().split(" ");
			if(Arrays.equals(inputStr,stopArr)) break;
			
			int[] inputNum = new int[3];
			int[] sortNum = new int[3];
			int maxNum = 0;
			int minNum = 30000;
			for(int i=0;i<3;i++){
				inputNum[i] = Integer.parseInt(inputStr[i]);
				if(minNum>inputNum[i]){
					minNum=inputNum[i];
					sortNum[0]=inputNum[i];
				}if(maxNum<inputNum[i]){
					maxNum=inputNum[i];
					sortNum[2]=inputNum[i];
				}
			}
			
			for(int i : inputNum){
				if(i!=sortNum[0] && i!=sortNum[2]){
					sortNum[1] = i;
				}
			}

			if((sortNum[0]*sortNum[0]+sortNum[1]*sortNum[1])==(sortNum[2]*sortNum[2])){
				System.out.println("right");
			}else{
				System.out.println("wrong");
			}
		}
		
		
		
		
		
	}
}
