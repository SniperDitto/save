package pkg.Class2;

import java.io.*;

public class PrimeNum {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int from = Integer.parseInt(br.readLine());
		int to = Integer.parseInt(br.readLine());
		
		
		
		bw.flush();
		bw.close();
		br.close();
	}
}
