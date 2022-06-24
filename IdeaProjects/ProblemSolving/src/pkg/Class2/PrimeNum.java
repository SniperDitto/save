package pkg.Class2;

import java.io.*;

public class PrimeNum {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int from = Integer.parseInt(br.readLine());
		int to = Integer.parseInt(br.readLine());
		int sum = 0;
		int min = to;
		boolean isNoValue = true;
		
		for(int i=from;i<=to;i++){
			if(primeNum(i) && i!=1){
				isNoValue = false;
				if(i<min) min = i;
				sum+=i;
			}
		}
		if(!isNoValue){
			bw.append(String.valueOf(sum));
			bw.append("\n");
			bw.append(String.valueOf(min));
		}else{
			bw.append(String.valueOf(-1));
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
