package pkg.daily;

import java.io.*;
import java.util.*;

public class SortingXY {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		int inputCaseNum = Integer.parseInt(br.readLine());
		int[][] inputArr = new int[inputCaseNum][2];
		
		for(int i=0;i<inputCaseNum;i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			inputArr[i][0] = Integer.parseInt(st.nextToken());
			inputArr[i][1] = Integer.parseInt(st.nextToken());
		}
		
		Arrays.sort(inputArr, (a, b)->{
			if(a[0]==b[0]){
				return a[1] - b[1];
			}else{
				return a[0] - b[0];
			}
		});
		
		for(int i=0;i<inputCaseNum;i++){
			bw.append(String.valueOf(inputArr[i][0]));
			bw.append(" ");
			bw.append(String.valueOf(inputArr[i][1]));
			bw.append("\n");
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
