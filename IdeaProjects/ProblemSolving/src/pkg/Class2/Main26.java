package pkg.Class2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main26 {
	public static void main(String[] args) throws IOException {
		//블랙잭 나중에 재귀함수 보고 마저 완성하기
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] firstLine = br.readLine().split(" ");
		int inputCardNum = Integer.parseInt(firstLine[0]);
		int targetNum = Integer.parseInt(firstLine[1]);
		
		String[] cards = br.readLine().split(" ");
		int[] cardNums = new int[inputCardNum];
		
		for(int i=0;i<inputCardNum;i++){
			cardNums[i] = Integer.parseInt(cards[i]);
		}
		
		
		
	}
}
