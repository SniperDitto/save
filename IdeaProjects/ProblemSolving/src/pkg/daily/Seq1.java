package pkg.daily;

import java.io.*;

public class Seq1 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int inNum = Integer.parseInt(br.readLine());
		int cnt = 0;
		
		for(int i=1;i<=inNum;i++){
			if(isSeqNumber(i)==true) cnt++;
		}
		
		bw.append(String.valueOf(cnt));
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static boolean isSeqNumber(int input){
		boolean isSeqNum = true;
		
		String inStr = Integer.toString(input);
		int length = inStr.length();
		
		if (length==1) return true;
		
		int[] seqArr = new int[length-1];
		for(int i=1;i<length;i++){
			int num1 = inStr.charAt(i-1);
			int num2 = inStr.charAt(i);
			
			seqArr[i-1] = num1-num2;
		}
		
		int seq = seqArr[0];
		for(int i : seqArr){
			if(i!=seq) return false;
		}
		
		return isSeqNum;
	}
}
