package pkg.daily;

import java.io.*;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/11047
public class Coin {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int numCoin = Integer.parseInt(st.nextToken());
		int price = Integer.parseInt(st.nextToken());
		int[] coins = new int[numCoin];
		int count = 0;
		
		for(int i=0;i<numCoin;i++){
			coins[i] = Integer.parseInt(br.readLine());
		}
		
		for(int i=numCoin;i>0;i--){
			if(coins[i-1]<=price){
				int chkVal = coins[i-1];
				count += price/chkVal;
				price = price%chkVal;
				
				if(price==0) break;
			}
		}
		
		bw.write(String.valueOf(count));
		bw.flush();
		bw.close();
		br.close();
	}
}
