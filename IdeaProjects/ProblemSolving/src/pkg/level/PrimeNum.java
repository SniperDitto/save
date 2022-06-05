package pkg.level;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class PrimeNum {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int inputNum = Integer.parseInt(br.readLine());
		//br.readLine();
		String[] inputCase = br.readLine().split(" ");
		ArrayList<Integer> primeNums = new ArrayList<>();
		int cntPrime = 0;
		
		for(int i=1;i<=1000;i++){
			primeNums.add(i);
		}
		
		for(int i=2;i<=1000;i++){
			//2 이상의 자연수에 대해
			for(int j=2;j<=1000;j++){
				//자기자신(i*1)을 제외한 것들 삭제
				primeNums.remove((Integer) (i*j));
			}
		}
		
		
		for(Integer pnum : primeNums) {
			for (int i = 0; i < inputNum; i++) {
				int chkNum = Integer.parseInt(inputCase[i]);
				if ( chkNum== pnum && chkNum!=1) {
					cntPrime++;
				}
			}
		}
		System.out.println(cntPrime);

		br.close();
	}
}
