package pkg.Class2;

import java.io.*;

public class Sort3 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int length = Integer.parseInt(br.readLine());
		int[] inNums = new int[length];
		int[] checkArr = new int[10000];//index+1 = 값
		
		for(int i=0;i<length;i++){
			int input = Integer.parseInt(br.readLine());
			checkArr[input-1]++;
		}
		
		for(int i=0;i<10000;i++){
			for(int j=0;j<checkArr[i];j++){
				bw.append(String.valueOf(i+1));
				bw.append("\n");
			}
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
