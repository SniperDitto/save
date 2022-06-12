package pkg.bruteforce;

import java.io.*;

//https://www.acmicpc.net/problem/2231
public class DivSum {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int inputNum = Integer.parseInt(br.readLine());
		
		int chkNum = 0;
		int result = 0;
		for(int i=1;i<=inputNum;i++){
			chkNum = getNumber(i);
			if(chkNum==inputNum) {
				result = i;
				break;
			}
		}
		bw.write(String.valueOf(result));
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static int getNumber(int input){
		int result = input;
		String strInput = Integer.toString(input);
		int strLength = strInput.length();
		
		for(int i=0;i<strLength;i++){
			result += Integer.parseInt(strInput.substring(i,i+1));
		}
		
		return result;
	}
	
}
