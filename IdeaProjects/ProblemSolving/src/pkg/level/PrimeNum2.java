package pkg.level;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class PrimeNum2 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int startNum = Integer.parseInt(br.readLine());
		int lastnum = Integer.parseInt(br.readLine());
		ArrayList<Integer> primeNums = new ArrayList<>();
		
		for(int i=1;i<=lastnum;i++){
			primeNums.add(i);
		}
		
		
		
		for(int i=2;i<=lastnum;i++){
			//2 이상의 자연수에 대해
			for(int j=2;j<=lastnum;j++){
				//자기자신(i*1)을 제외한 것들 삭제
				primeNums.remove((Integer) (i*j));
			}
		}
		
		int sumPrime = 0;
		for(Integer pnum : primeNums){
			if(pnum >= startNum){
				sumPrime += pnum;
				//System.out.println(pnum);
			}
		}
		
		if(sumPrime==0) sumPrime = -1;
		
		System.out.println(sumPrime);
		for(Integer pnum : primeNums){
			if(pnum >= startNum){
				System.out.println(pnum);
				break;
			}
		}
	}
}
