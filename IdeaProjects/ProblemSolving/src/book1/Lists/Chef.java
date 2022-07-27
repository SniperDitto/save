package book1.Lists;

import java.io.*;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/2953
public class Chef {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int[] grades = {0,0,0,0,0};
		int max = 0;
		int maxIdx = 0;
		
		for(int i=0;i<5;i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			int sum = 0;
			while (st.hasMoreTokens()){
				sum += Integer.parseInt(st.nextToken());
			}
			grades[i] = sum;
			if(max<sum) {
				max = sum;
				maxIdx = i;
			}
			
		}
		
		bw.append(String.valueOf(maxIdx+1));
		bw.append(" ");
		bw.append(String.valueOf(max));
		bw.flush();
		bw.close();
		br.close();
	}
}
