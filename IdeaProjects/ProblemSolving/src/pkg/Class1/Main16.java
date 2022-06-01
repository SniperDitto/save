package pkg.Class1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main16 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String inputStr = br.readLine();
		String[] inputArr = inputStr.trim().split(" ");
		int result = inputArr.length;
		for(String s : inputArr){
			if(s.equals("")){
				result--;
			}
		}
		System.out.println(result);
		
	}
}
