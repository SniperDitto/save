package pkg.Class2;

import java.io.*;

public class ApartMent {
	public static void main(String[] args) throws IOException {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int caseNum = Integer.parseInt(br.readLine());
		int[] baseFloorArr = {1,2,3,4,5,6,7,8,9,10,11,12,13,14};
		long population = 0;
		
		for(int c=0;c<caseNum;c++){
			int a = Integer.parseInt(br.readLine());
			int b = Integer.parseInt(br.readLine());
			int[] floorArr = new int[14];
			int[] prevFloorArr = baseFloorArr;
			
			for(int i=0;i<a;i++) {
				for(int j=0;j<b;j++){
					for(int k=0;k<=j;k++) {
						floorArr[j] += prevFloorArr[k];
					}
				}
				prevFloorArr = floorArr;
				population = floorArr[b-1];
				/*
				for(int j=0;j<b;j++){
					bw.append(String.valueOf(floorArr[j]));
					bw.append(" ");
				}
				*/
				bw.append("\n");
				floorArr = new int[14];
			}
			
			
			bw.append("사람수 : ");
			bw.append(String.valueOf(population));
			bw.append("\n");
			
		}
		
		
		bw.flush();
		bw.close();
		br.close();
	}
}
