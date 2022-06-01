package pkg.Class1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main21 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int inputNum = Integer.parseInt(br.readLine());
		String[] inputScoresStr = br.readLine().split(" ");
		int[] inputScores = new int[inputNum];
		double[] resultArr = new double[inputNum];
		
		int maxScore = 0;
		for(int i=0;i<inputNum;i++){
			inputScores[i] = Integer.parseInt(inputScoresStr[i]);
			if(inputScores[i]>maxScore){
				maxScore = inputScores[i];
			}
		}
		double sum=0;
		for(int i=0;i<inputNum;i++){
			resultArr[i] = (inputScores[i]/(double)maxScore*100.0);
			sum += resultArr[i];
		}
		double result = sum/inputNum;
		System.out.println(result);
		
	}
}
