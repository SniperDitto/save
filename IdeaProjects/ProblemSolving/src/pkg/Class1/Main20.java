package pkg.Class1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Main20 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String inputStr = br.readLine();
		int inputLength = inputStr.length();
		inputStr = inputStr.toUpperCase();
		int[] lettersCnt = new int[26];
		Arrays.fill(lettersCnt,0);
		String result = "";
		
		//알파벳개수세기
		for(int i=0;i<inputLength;i++){
			for(int j=65;j<91;j++){
				if((int)inputStr.charAt(i)==j){
					lettersCnt[j-65]++;
				}
			}
		}
		
		//갯수 최댓값구하기
		int maxLetterNum = 0;
		for(int i=0;i<26;i++){
			if(lettersCnt[i]>maxLetterNum) {
				maxLetterNum = lettersCnt[i];
			}
		}
		
		//최댓값이 한개인지?
		int maxCnt = 0;
		for(int i=0;i<26;i++){
			if(maxLetterNum==lettersCnt[i]) {
				maxCnt++;
				result = Character.toString(i+65);
			}
		}
		if(maxCnt>1){
			result="?";
		}
		System.out.println(result);
		
	}
}
