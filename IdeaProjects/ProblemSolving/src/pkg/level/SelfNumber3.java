package pkg.level;

import java.io.*;

public class SelfNumber3 {
	//https://www.acmicpc.net/problem/4673
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		String input = br.readLine();
		int resultNum = Integer.parseInt(input);
		while (resultNum<10000){
			System.out.println(resultNum);
			resultNum = getNumber(resultNum);
		}
		
	}
	
	public static int getNumber(int inputNum){
		String inputStr = Integer.toString(inputNum);
		int inStrLength = inputStr.length();
		int result = inputNum;
		int next = inputNum;
		
		while(inStrLength>0){
			result += next/(int)Math.pow(10,inStrLength-1);
			//System.out.println(next/(int)Math.pow(10,inStrLength-1));
			next = next%(int)Math.pow(10,inStrLength-1);
			inStrLength--;
		}
		
		return result;
	}

}
