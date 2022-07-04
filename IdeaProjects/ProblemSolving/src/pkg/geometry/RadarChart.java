package pkg.geometry;

import java.io.*;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;
//https://www.acmicpc.net/problem/25308
public class RadarChart {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		Set<Integer> stats = new HashSet<>();//-------
		int[] statArr = new int[8];
		int factorial_8 = 40320;
		int factorial_stat = getFactorial(stats.size());
		
		int idx = 0;
		while (st.hasMoreTokens()){
			int inNum = Integer.parseInt(st.nextToken());
			stats.add(inNum);//-------
			statArr[idx] = inNum;
			idx++;
		}
		idx=0;
		
		
		
		
		
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static int getFactorial(int input){
		if(input==1){
			return 1;
		}
		else{
			return input*getFactorial(input-1);
		}
	}
}
