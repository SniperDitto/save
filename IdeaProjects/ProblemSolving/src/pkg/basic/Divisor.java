package pkg.basic;

import java.io.*;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Divisor {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int divCount = Integer.parseInt(br.readLine());
		StringTokenizer st = new StringTokenizer(br.readLine());
		int[] divs = new int[divCount];
		
		for(int i=0;i<divCount;i++){
			divs[i] = Integer.parseInt(st.nextToken());
		}
		
		if(divCount==1){
			bw.append(String.valueOf(divs[divCount-1]*divs[divCount-1]));
		}else{
			Arrays.sort(divs);
			bw.append((String.valueOf(divs[0]*divs[divCount-1])));
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
