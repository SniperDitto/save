package pkg.Class1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main18 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String[] inputStr = br.readLine().split(" ");
		String[] numbers = {"",""};
		for(int i=2;i>=0;i--){
			numbers[0] += inputStr[0].charAt(i);
			numbers[1] += inputStr[1].charAt(i);
		}
		String result = Integer.parseInt(numbers[0]) > Integer.parseInt(numbers[1])
						? numbers[0]
						: numbers[1];
		System.out.println(result);
	}
}
