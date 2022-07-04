package pkg.basic;

import java.io.*;
import java.util.StringTokenizer;

public class BreakEvenPoint {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int A = Integer.parseInt(st.nextToken());
		int B = Integer.parseInt(st.nextToken());
		int C = Integer.parseInt(st.nextToken());
		//A : 고정지출
		//B : 가변비용
		//C : 1대당 판매가격
		
		//A + n*B <= n*C인 n이 존재하는가
		//A/(C-B)<=n

		
		if(B>=C){
			bw.append(String.valueOf(-1));
		}
		else{
			bw.append(String.valueOf(A/(C-B)+1));
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
