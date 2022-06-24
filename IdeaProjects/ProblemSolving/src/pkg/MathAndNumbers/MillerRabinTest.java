package pkg.MathAndNumbers;

public class MillerRabinTest {
	public static void main(String[] args) {
		int[] aArr = {2, 7, 61};
		long X = 1244283431;
		boolean isPrime=true;
		for(int i=0;i<3;i++) {
			if(X==aArr[i]) break;
			isPrime = MillerRabin(X,aArr[i]);
			if(isPrime==false) break;
		}
		
		System.out.println(isPrime);
		
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
			/*
			if(checkNum%X==0){
				return false;
			}
			long checkPower = X-1;
			while(true){
				
				long checkFermat = getPower(checkNum, checkPower, X);
				if(checkFermat==X-1){
					return true;
				}
				if(checkPower%2==0){
					
					return (checkFermat==1||checkFermat==X-1);
					//break;
				}
				checkPower /=2;//계속 루트씌우면서 확인
			}
			*/
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
				return (checkVal==1||checkVal==X-1);
			}
			xminus1/=2;
		}
		
	}
	
}
