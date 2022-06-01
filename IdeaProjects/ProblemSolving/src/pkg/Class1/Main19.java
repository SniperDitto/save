package pkg.Class1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main19 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] inputStr = new String[10];
		int[] chkNums = new int[42];
		
		for(int i=0;i<10;i++){
			inputStr[i] = br.readLine();
		}
		
		for(int i=0;i<42;i++){
			chkNums[i] = i;
		}
		
		for(int i=0;i<10;i++){
			for(int j=0;j<42;j++){
				if(Integer.parseInt(inputStr[i])%42==j){
					chkNums[j]=-1;
				}
			}
		}
		
		int result = 0;
		for(int i=0;i<42;i++){
			if(chkNums[i]==-1){
				result++;
			}
		}
		System.out.println(result);
	}
}
