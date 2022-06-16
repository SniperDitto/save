package pkg.Class2;

import java.io.*;
import java.util.StringTokenizer;

public class Hashing {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int length = Integer.parseInt(br.readLine());
		StringTokenizer st = new StringTokenizer(br.readLine());
		long hashVal = 0;
		String inputStr = st.nextToken();
		for(int i=0;i<length;i++){
			int ascii = inputStr.charAt(i)-96;
			long power = 1;
			for(int j=0;j<i;j++){
				power *= 31%1234567891;
				power = power%1234567891;
			}
			hashVal += ascii*power%1234567891;
		}
		hashVal = hashVal%1234567891;
		
		bw.append(String.valueOf(hashVal));
		bw.flush();
		bw.close();
		br.close();
	}
}
