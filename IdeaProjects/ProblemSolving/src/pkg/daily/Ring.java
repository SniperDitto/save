package pkg.daily;

import java.io.*;
import java.util.StringTokenizer;

public class Ring {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int numRings = Integer.parseInt(br.readLine());
		
		StringTokenizer st = new StringTokenizer(br.readLine());
		int[] r = new int[numRings];
		
		int firstRing = Integer.parseInt(st.nextToken());
		for(int i=1;i<numRings;i++){
			int nextRing = Integer.parseInt(st.nextToken());
			int gcd=getGCD(firstRing,nextRing);
			//System.out.println("gcd : "+gcd);
			bw.append(String.valueOf(firstRing/gcd));
			bw.append("/");
			bw.append(String.valueOf(nextRing/gcd));
			if(i!=numRings-1){
				bw.append("\n");
				bw.flush();
			}
		}
		
		
		bw.close();
		br.close();
	}
	
	public static int getGCD(int A, int B){
		int mod = A%B;
		if(mod==0){
			return B;
		}
		else{
			return getGCD(B,mod);
		}
		/*
		while (B!=0){
			int next = A % B;
			A = B;
			B = next;
		}
		return A;
		 */
	}
}
