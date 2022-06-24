package pkg.MathAndNumbers;

import java.io.*;
import java.util.StringTokenizer;

public class FastPower {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		
		long a = Long.parseLong(st.nextToken());
		long n = Long.parseLong(st.nextToken());
		long mod = Long.parseLong(st.nextToken());
		
		bw.write(String.valueOf(getPower(a,n,mod)));
		
		bw.flush();
		bw.close();
		br.close();
	}
	
	//a의 n제곱을 빠르게 구하는 함수
	public static long getPower(long a, long n, long mod){
		/*
		long result = 1;
		
		while(n!=0){
			if((n%2)==1){
				result = ((result%mod) * (a%mod)) % mod;
			}
			n /= 2;
			n %= mod;
			a = ((a%mod) * (a%mod)) % mod;
		}
		*/
		
		a %= mod;
		if(n==0){
			return 1;
		}
		long unitPow = getPower(a, n/2, mod);
		if(n%2==0){
			return (unitPow%mod)*(unitPow%mod)%mod;
		}else{
			return ((unitPow*unitPow%mod)*a)%mod;
		}
		
		//return result;
	}
	
}
