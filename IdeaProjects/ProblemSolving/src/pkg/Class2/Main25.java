package pkg.Class2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class Main25 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int inputNum = Integer.parseInt(br.readLine());//몇 개의 값이 들어오는지
		String[][] inputCases = new String[inputNum][3];//h,w,n 저장할 배열
		ArrayList<String> resultRoomNums = new ArrayList<String>();//결과 방번호 저장할 배열
		
		for(int i=0;i<inputNum;i++){
			//층수(H), 층별 방 수(W), 손님수(N)
			inputCases[i] = br.readLine().split(" ");
			
		}
		
		for(int i=0;i<inputNum;i++){
			int h = Integer.parseInt(inputCases[i][0]);
			int w = Integer.parseInt(inputCases[i][1]);
			int n = Integer.parseInt(inputCases[i][2]);
			int[][] roomsArr = new int[h][w];
			//h에 우선 배정, 그다음 w
			int cnt = 0;
			for(int indexW=1;indexW<=w;indexW++){
				for(int indexH=1;indexH<=h;indexH++){
					if(roomsArr[indexH-1][indexW-1]==0){
						roomsArr[indexH-1][indexW-1]=1;
					}
					cnt++;
					if(cnt==n) {
						resultRoomNums.add(Integer.toString(indexH));
						break;
					}
				}
				if(cnt==n) {
					int size=resultRoomNums.size();
					if(indexW<10){
						resultRoomNums.set(size-1,resultRoomNums.get(size-1)+"0"+indexW);
					}else{
						resultRoomNums.set(size-1,resultRoomNums.get(size-1)+indexW);
					}
					break;
				}
			}
		}
		
		for(String s : resultRoomNums){
			System.out.println(s);
		}
		
		
	}
	
}
