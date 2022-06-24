package pkg.MathAndNumbers;

import java.io.*;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/5086
public class MulandDiv {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		while(true){
			StringTokenizer st = new StringTokenizer(br.readLine());
			int first = Integer.parseInt(st.nextToken());
			if(first==0) break;
			int second = Integer.parseInt(st.nextToken());
			
			if(second%first==0) bw.append("factor");
			else if(first%second==0) bw.append("multiple");
			else bw.append("neither");
			bw.append("\n");
		}
		
		
		bw.flush();
		bw.close();
		br.close();
	}
}
