package pkg.Class1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Main17 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String inputStr = br.readLine();
		int[] alphabetArr = new int[26];
		Arrays.fill(alphabetArr,-1);
		
		for(int i=0;i<inputStr.length();i++){
			char inputChar = inputStr.charAt(i);
			for(int j=97;j<123;j++){
				if((int)inputChar==j){
					alphabetArr[j-97] = (alphabetArr[j-97]==-1)? i : alphabetArr[j-97];
				}
			}
		}
		for(int i=0;i<alphabetArr.length;i++){
			System.out.print(alphabetArr[i]);
			if(i!= alphabetArr.length-1){
				System.out.print(" ");
			}else{
				System.out.println();
			}
		}
	}
}
