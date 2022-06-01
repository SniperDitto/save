package pkg.Class1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main14 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int numLength = Integer.parseInt(br.readLine());
		String numStr = br.readLine();
		int sum = 0;
		
		for(int i=0;i<numStr.length();i++){
			sum += Integer.parseInt(numStr.substring(i,i+1));
		}
		
		System.out.println(sum);
	}
}
