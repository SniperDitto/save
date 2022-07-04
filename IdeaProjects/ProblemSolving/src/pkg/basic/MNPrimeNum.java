package pkg.basic;

import java.io.*;
import java.util.StringTokenizer;

public class MNPrimeNum {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		
		int M = Integer.parseInt(st.nextToken());
		int N = Integer.parseInt(st.nextToken());
		
		for(int i=M;i<=N;i++){
			if(primeNum(i)) {
				if(i==1) continue;
				bw.append(String.valueOf(i));
				bw.append("\n");
			}
			
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static boolean primeNum(int input){
		boolean isPrimeNum = true;
		
		for(int i=2;i*i<=input;i++){
			if(input%i==0){
				isPrimeNum = false;
			}
		}
		
		return isPrimeNum;
	}
	
}
