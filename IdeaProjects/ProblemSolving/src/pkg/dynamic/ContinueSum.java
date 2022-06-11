package pkg.dynamic;

import java.io.*;
import java.util.StringTokenizer;

public class ContinueSum {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int inputNum = Integer.parseInt(br.readLine());
		StringTokenizer st = new StringTokenizer(br.readLine());
		int[] inputCase = new int[inputNum];
		
		for(int i=0;i<inputNum;i++){
			inputCase[i] = Integer.parseInt(st.nextToken());
		}
		
		//two pointer algorithm
		int left, right = 0;
		int tempSum = 0;
		int max = inputCase[0];
		
		while (right<inputNum){
			//합에 추가
			tempSum += inputCase[right];
			if(max<tempSum){
				max = tempSum;
			}
			if(tempSum<0){
				//새로운 범위 시작
				tempSum=0;
				right++;
				left=right;
				if(left>=inputNum) break;
			}else{
				//기존 범위 확장
				right++;
			}
			
		}

		bw.write(max+"\n");
		bw.flush();
		bw.close();
		br.close();
	}
}
