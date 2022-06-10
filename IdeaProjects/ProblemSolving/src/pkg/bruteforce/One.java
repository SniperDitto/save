package pkg.bruteforce;

import java.io.*;

public class One {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		String inputCase = "";
		while ((inputCase=br.readLine())!=null && !inputCase.equals("")){
			int caseNum = Integer.parseInt(inputCase);
			long chkNum = 0;
			int digits = 0;
			while(true) {
				chkNum = chkNum*10+1;
				chkNum %= caseNum;
				digits++;
				if (chkNum % caseNum == 0) {
					//System.out.println(checkStr.length());
					bw.write(digits+"\n");
					break;
				}
				
			}
		}
		
		
		bw.flush();
		bw.close();
		br.close();
	}
}
