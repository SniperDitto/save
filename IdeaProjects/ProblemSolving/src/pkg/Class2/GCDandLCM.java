package pkg.Class2;

import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class GCDandLCM {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int A = Integer.parseInt(st.nextToken());
		int B = Integer.parseInt(st.nextToken());
		
		ArrayList<Integer> aArr = getDivs(A);//A의 약수
		ArrayList<Integer> bArr = getDivs(B);//B의 약수
		ArrayList<Integer> commons = new ArrayList<>();//A B의 공약수
		
		bw.append("A : ");
		for(int a:aArr){
			bw.append(a+" ");
		}
		bw.append("\n");
		bw.append("B : ");
		for(int b:bArr){
			bw.append(b+" ");
		}
		bw.append("\n");
		
		
		
		
		
		for(int i=0;i<aArr.size();i++){
			int val1 = aArr.get(i);
			for(int j=0;j<bArr.size();j++){
				int val2 = bArr.get(j);
				if(val1==val2 && val2!=0){
					commons.add(val2);
					bArr.set(j,0);
					break;
				}
			}
		}
		
		
		long GCD = 1;
		long LCM = 1;
		
		for(int i:commons){
			GCD *= i;
		}
		LCM = A*B/GCD;
		
		
		
		
		bw.append("Common : ");
		for(int c:commons){
			bw.append(c+" ");
		}
		bw.append("\n");
		
		
		
		bw.append(GCD+"\n");
		bw.append(String.valueOf(LCM));
		
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static ArrayList<Integer> getDivs(int A){
		ArrayList<Integer> result = new ArrayList<>();
		
		int divNum = 2;
		while(A!=1){
			if(A%divNum==0){
				result.add(divNum);
				A /= divNum;
			}else{
				divNum++;
			}
		}
		
		return result;
	}
	
}
