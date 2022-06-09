package pkg.level;

import java.io.*;

public class SelfNumber2 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		String inStr = br.readLine();
		int inStrLength = inStr.length();
		int inputNum = Integer.parseInt(inStr);
		int result = 0;
		int next = inputNum;
		
		while(inStrLength>0){
			next = getNextNum(next,inStrLength-1);
			inStrLength--;
		}
		
		
	}
	
	public static int getNextNum(int inputNum, int pow){
		int temp = (int)Math.pow(10,pow);
		System.out.printf("%d의자리 : %d\n", temp, inputNum/temp);
		
		return (inputNum%temp);
	}
	
}
