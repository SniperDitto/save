package pkg.basic;

import java.io.*;

public class InputOutput {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		String inputStr = "";
		while ((inputStr = br.readLine())!=null && !inputStr.equals("")){
			bw.write(inputStr+"\n");
		}
		
		br.close();
		bw.flush();
		bw.close();
	}
}
