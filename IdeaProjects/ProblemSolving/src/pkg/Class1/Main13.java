package pkg.Class1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main13 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int numCase = Integer.parseInt(br.readLine());
		int pointCnt = 0;
		int pointSum = 0;
		int[] pointArr = new int[numCase];
		
		for (int i = 0; i < numCase; i++) {
			String testCase = br.readLine();
			for (int j = 0; j < testCase.length(); j++) {
				String chkChar = testCase.substring(j, j + 1);
				if (chkChar.equals("O")) {
					pointCnt++;
					pointSum += pointCnt;
				} else {
					pointCnt = 0;
				}
			}
			pointArr[i] = pointSum;
			pointCnt = 0;
			pointSum = 0;
		}
		
		for(int i : pointArr){
            System.out.println(i);
        }
	}
}
