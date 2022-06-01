package pkg.Class2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main23 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] inputStr = br.readLine().split(" ");
		int A = Integer.parseInt(inputStr[0]);
		int B = Integer.parseInt(inputStr[1]);
		int V = Integer.parseInt(inputStr[2]);
		//int result = Math.ceil((V-B)/(A-B));
		System.out.println((int) Math.ceil((double) (V-B)/(double) (A-B)));
		
	}
}
