package pkg.daily;

import java.io.*;
import java.util.*;

public class FindingNumber {
	public static int arrLength;
	public static int caseLength;
	public static int[] arr;
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		arrLength = Integer.parseInt(br.readLine());
		StringTokenizer strArray = new StringTokenizer(br.readLine());
		
		arr = new int[arrLength];
		
		for(int i=0;i<arrLength;i++){
			arr[i]=Integer.parseInt(strArray.nextToken());
		}
		
		Arrays.sort(arr);
		
		caseLength = Integer.parseInt(br.readLine());
		StringTokenizer strCase = new StringTokenizer(br.readLine());
		
		
		while (strCase.hasMoreTokens()){
			int num = Integer.parseInt(strCase.nextToken());
			
			bw.append(String.valueOf(checkExist(num)));
			bw.append("\n");
			
		}
		
		
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static int checkExist(int input){
		int result = 0;
		int start = 0;
		int end = arrLength-1;
		int checkIndex = (start+end)/2;
		
		while(start<=end){
			checkIndex = (start+end)/2;
			int checkVal = arr[checkIndex];
			if(checkVal==input){
				return 1;
			}else if(checkVal<input){
				start = checkIndex+1;
			}else{
				end = checkIndex-1;
			}
		}
		
		return result;
	}
	
}
