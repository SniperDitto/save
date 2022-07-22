package pkg.Class2;

import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class ChessBoard {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int height = Integer.parseInt(st.nextToken());
		int width = Integer.parseInt(st.nextToken());
		
		int minCnt = 0;
		int tempCnt = 0;
		
		String[] board = new String[height];
		for(int h=0;h<height;h++){
			board[h] = br.readLine();
		}
		
		ArrayList<Integer> countArr = new ArrayList<>();
		int startH = 0;
		int startW = 0;
		String[] checkArr = new String[8];
		
		while (startH+8<=height && startW+8<=width){
			for(int i=0;i<8;i++){
				checkArr[i] = board[startH].substring(startW,startW+8);
			}
			countBoard(checkArr);
			if(startH+8<=height && startW+8<=width){
			
			}
			startH++;
			startW++;
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static int countBoard(String[] checkArr){
		int[] count = {0,0};
		
		String[] sample1 = {
				"WBWBWBWB",
				"BWBWBWBW",
				"WBWBWBWB",
				"BWBWBWBW",
				"WBWBWBWB",
				"BWBWBWBW",
				"WBWBWBWB",
				"BWBWBWBW"
		};
		String[] sample2 = {
				"BWBWBWBW",
				"WBWBWBWB",
				"BWBWBWBW",
				"WBWBWBWB",
				"BWBWBWBW",
				"WBWBWBWB",
				"BWBWBWBW",
				"WBWBWBWB"
		};
		
		for(int i=0;i<8;i++){
			for(int j=0;j<8;j++){
				if(checkArr[i].charAt(j)!=sample1[i].charAt(j)){
					count[0]++;
				}
				if(checkArr[i].charAt(j)!=sample2[i].charAt(j)){
					count[1]++;
				}
			}
		}
		
		if(count[0]>count[1]){
			return count[1];
		}else{
			return count[0];
		}
	}
	
}
