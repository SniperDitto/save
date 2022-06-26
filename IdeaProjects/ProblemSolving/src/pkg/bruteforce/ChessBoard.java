package pkg.bruteforce;

import java.io.*;
import java.util.StringTokenizer;

public class ChessBoard {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int lines = Integer.parseInt(st.nextToken());
		int width = Integer.parseInt(st.nextToken());
		String[][] boards = new String[lines][width];
		
		for(int l=0;l<lines;l++){
			String nextBoardLine = br.readLine();
			for(int w=0;w<width;w++){
				boards[l][w] = nextBoardLine.substring(w,w+1);
			}
		}
		
		//어떤 영역에 대해 홀수번째/짝수번째 index 비교?
		
		
		
		bw.flush();
		bw.close();
		br.close();
		
	}
}
