package pkg.bruteforce;

import java.io.*;
import java.util.StringTokenizer;

public class BlackJack {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st1 = new StringTokenizer(br.readLine());
		
		int cardNum = Integer.parseInt(st1.nextToken());
		int targetNum = Integer.parseInt(st1.nextToken());
		
		StringTokenizer st2 = new StringTokenizer(br.readLine());
		int[] inputNums = new int[cardNum];
		for(int i=0;i<cardNum;i++){
			inputNums[i] = Integer.parseInt(st2.nextToken());
		}
		
		int[] pickCards = new int[3];
		int[] leftCards = inputNums;
		int bestSum = 0;
		
		for(int i=0;i<cardNum;i++){
			for(int j=i+1;j<cardNum;j++){
				for(int k=j+1;k<cardNum;k++){
					pickCards[0]=leftCards[i];
					pickCards[1]=leftCards[j];
					pickCards[2]=leftCards[k];
					
					int sum = pickCards[0]+pickCards[1]+pickCards[2];
					int chkNum = targetNum-sum;
					if (chkNum>=0 && bestSum<sum){
						bestSum = sum;
					}
				}
			}
		}
		bw.write(String.valueOf(bestSum));
		bw.flush();
		bw.close();
		br.close();
	}
}
