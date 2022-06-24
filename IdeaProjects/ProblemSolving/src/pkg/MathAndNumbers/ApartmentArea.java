package pkg.MathAndNumbers;

import java.io.*;

public class ApartmentArea {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int caseNum = Integer.parseInt(br.readLine());
		int[] aArr = {2, 7, 61};
		int cnt = 0;
		
		for(int i=0;i<caseNum;i++){
			long X = Integer.parseInt(br.readLine());
			boolean isPrime=true;
			for(int j=0;j<3;j++) {
				if(X==aArr[j]) break;
				isPrime = MillerRabin(X*2+1,aArr[j]);
				if(isPrime==false) break;
			}
			
			if(isPrime==true){
				cnt++;
			}
			
		}
		bw.append(String.valueOf(cnt));
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static long getPower(long a, long n, long mod){
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
	}
	
	public static boolean MillerRabin(long X, long a){
		//Miller-Rabin Test
		//a{2,7,61}에 대해 a의 X-1제곱을 X로 나눈 나머지 1인지 확인
		//1이면 좌변에 루트씌우고 X로 나눈 나머지가 1, -1->X-1인지 확인
		//	1이면 X-1이 홀수인지 확인(소수)
		//	X-1이면 소수
		//->나머지 경우에는 소수아님~~
		if(a%X==0) return false;
		
		long xminus1 = X-1;
		
		while(true){
			long checkVal = getPower(a,xminus1,X);
			if(checkVal==X-1){
				return true;
			}
			if(xminus1%2==1){
				if(checkVal==1) return true;
				if(checkVal==X-1) return true;
				else return false;
			}
			xminus1/=2;
		}
		
	}
	
}
