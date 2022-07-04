package pkg.basic;

import java.io.*;

public class Dial {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		String inputStr = br.readLine();
		String[][] dialArr = {{""},{""},{""},{"A","B","C"},{"D","E","F"},{"G","H","I"},{"J","K","L"},{"M","N","O"},{"P","Q","R","S"},{"T","U","V"},{"W","X","Y","Z"}};
		int time = 0;
		
		for(int i=0;i<inputStr.length();i++){
			String chkStr = inputStr.substring(i,i+1);
			for(int j=0;j<dialArr.length;j++){
				for(int k=0;k<dialArr[j].length;k++){
					if(chkStr.equals(dialArr[j][k])){
						time += j;
					}
				}
			}
		}
		
		bw.append(String.valueOf(time));
		bw.flush();
		bw.close();
		br.close();
	}
}
