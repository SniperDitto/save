package pkg.Class1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main15 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] inputStr = br.readLine().split(" ");
		int inputNum = Integer.parseInt(inputStr[0]);
		int chkNum = Integer.parseInt(inputStr[1]);
		
		String[] inputCase = br.readLine().split(" ");
		StringBuilder sb = new StringBuilder();
		
		for(int i=0;i<inputNum;i++){
			if(chkNum>Integer.parseInt(inputCase[i])){
				sb.append(inputCase[i]);
				if(i!=inputNum-1){
					sb.append(" ");
				}
			}
		}
		System.out.println(sb);
	}
}
