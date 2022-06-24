package pkg.MathAndNumbers;

import java.io.*;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/1009
public class ComputerNumber {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int caseNum = Integer.parseInt(br.readLine());
		
		for(int i=0;i<caseNum;i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			int a = Integer.parseInt(st.nextToken());
			int b = Integer.parseInt(st.nextToken());
			
			long result = getPower(a,b,10);
			if(result==0) bw.append(String.valueOf(10));
			else bw.append(String.valueOf(result));
			bw.append("\n");
		}
		
		
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static long getPower(long a, long b, long mod){

		a %= mod;
		if(b==0){
			return 1;
		}
		long unitPow = getPower(a, b/2, mod);
		if(b%2==0){
			return (unitPow%mod)*(unitPow%mod)%mod;
		}else{
			return ((unitPow*unitPow%mod)*a)%mod;
		}
		
		//return result;
	}
	
}
