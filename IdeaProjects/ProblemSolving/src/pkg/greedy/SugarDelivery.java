package pkg.greedy;

import java.io.*;
//https://www.acmicpc.net/problem/2839
public class SugarDelivery {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int N = Integer.parseInt(br.readLine());
		if(N==4 || N==7){
			bw.write(String.valueOf(-1));
		}else{
			int x = 0;
			float y = 0;
			while(true){
				y=(float) (N-3*x)/5;
				if(y%1.0==0){
					break;
				}
				x++;
			}
			bw.write(String.valueOf((int)(x+y)));
		}
		bw.flush();
		bw.close();
		br.close();
	}
}
