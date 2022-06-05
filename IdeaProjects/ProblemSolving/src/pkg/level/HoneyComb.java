package pkg.level;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class HoneyComb {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		long inputNum = Integer.parseUnsignedInt(br.readLine());
		
		int index = 2;
		long nextNum = 2;
		while (nextNum<=inputNum){
			nextNum = getNumber(nextNum,index);
			index++;
		}
		System.out.println(index-1);//index가 2부터 시작하므로
	}
	public static long getNumber(long prevNum, int index){
		return prevNum + 6 * (index-1);
	}
	
}
