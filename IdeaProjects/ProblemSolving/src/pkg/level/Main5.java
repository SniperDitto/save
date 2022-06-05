package pkg.level;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main5 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int caseNum = Integer.parseInt(br.readLine());
		
		for(int i=0;i<caseNum;i++){
			String input = br.readLine();
			String[] inputCase = input.split(" ");
			int studNum = Integer.parseInt(inputCase[0]);
			
			int[] studScores = new int[studNum];
			int sumScore = 0;
			double avgScore = 0;
			int overAvgCnt = 0;
			
			for(int j=0;j<studNum;j++){
				studScores[j] = Integer.parseInt(inputCase[j+1]);
				sumScore+=studScores[j];
			}
			avgScore = (double) sumScore/studNum;
			
			for(int j=0;j<studNum;j++){
				if(studScores[j]>avgScore){
					overAvgCnt++;
				}
			}
			double result = ((double) overAvgCnt/studNum)*100.0;
			System.out.println(String.format("%.3f",result)+"%");

		}
		
	}
}
