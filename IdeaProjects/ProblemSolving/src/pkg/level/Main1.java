package pkg.level;

import java.io.*;

public class Main1 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		int inputNum = Integer.parseInt(br.readLine());
		
		for(int i=0;i<inputNum;i++){
			String[] inputCase = br.readLine().split(" ");
			int result = Integer.parseInt(inputCase[0])+Integer.parseInt(inputCase[1]);
			bw.write(result+"\n");
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
