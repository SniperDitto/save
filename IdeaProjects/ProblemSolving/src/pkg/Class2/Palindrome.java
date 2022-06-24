package pkg.Class2;

import java.io.*;
//https://www.acmicpc.net/problem/1259
public class Palindrome {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		String nextStr;
		while (!(nextStr = br.readLine()).equals("0")){
			boolean isPalin = true;
			int length = nextStr.length();
			for(int i=0;i<length/2;i++){
				String headStr = nextStr.substring(i,i+1);
				String tailStr = nextStr.substring(length-i-1,length-i);
				if(!headStr.equals(tailStr)){
					isPalin = false;
				}
			}
			if(isPalin){
				bw.append("yes");
			}else{
				bw.append("no");
			}
			bw.append("\n");
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
