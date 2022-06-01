package pkg.level;

import java.io.*;

public class Main4 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		String inputStr = br.readLine();

		int inputNum = Integer.parseInt(inputStr);
		if(inputNum<10 && 0<inputNum){
			inputStr = "0"+inputStr;
		}
		
		String resultStr = doCycle(inputStr);
		int cycleCnt = 1;
		while (!(Integer.parseInt(resultStr)==inputNum)){
			resultStr = doCycle(resultStr);
			cycleCnt++;
		}
		
		bw.write(cycleCnt+"\n");
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static String doCycle(String input){
		//cycle 1회 실행 후 나오는 숫자 return
		String result = "";
		
		int num1 = Integer.parseInt(input.substring(0,1));
		int num2 = Integer.parseInt(input.substring(input.length()-1));
		int num3 = num1 + num2;
		String sumStr = Integer.toString(num3);
		result = input.substring(input.length()-1)
						 + sumStr.substring(sumStr.length()-1);
		
		return result;
	}
	
}
