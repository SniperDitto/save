package pkg.level;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;

public class SelfNumber {
	public static void main(String[] args) throws IOException {
		//시간초과@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		ArrayList<Integer> selfNumbers = new ArrayList<>();
		
		for(int i=1;i<=10000;i++){
			selfNumbers.add(i);
		}

		for(int i=1;i<=10000;i++){
			int num=i;
			while(true){
				if(num>10000) break;
				num = getNextNum(num);
				selfNumbers.remove((Integer) num);
			}
		}
		
		for(Integer i : selfNumbers){
			bw.write(i+"\n");
		}
		
		bw.flush();
		bw.close();
	}
	
	public static int getNextNum(int inNum) {
		int result = inNum;
		int inStrLength = Integer.toString(inNum).length();
		
		result += inNum / (int) Math.pow(10, inStrLength - 1);
		
		for(int i=inStrLength-1;i>0;i--){
			result += (inNum % (int) Math.pow(10, i)) / (int) Math.pow(10, i - 1);
		}
		
		return result;
	}
	
}
