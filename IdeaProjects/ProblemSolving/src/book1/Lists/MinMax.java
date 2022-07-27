package book1.Lists;

import java.io.*;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/10818
public class MinMax {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int N = Integer.parseInt(br.readLine());
		StringTokenizer st = new StringTokenizer(br.readLine());
		int first = Integer.parseInt(st.nextToken());
		int min = first;
		int max = first;
		
		while(st.hasMoreTokens()){
			int next = Integer.parseInt(st.nextToken());
			if(min>next) min = next;
			if(max<next) max = next;
		}
		
		bw.append(String.valueOf(min));
		bw.append(" ");
		bw.append(String.valueOf(max));
		
		bw.flush();
		bw.close();
		br.close();
	}
}
