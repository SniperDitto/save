package pkg.basic;

import java.io.*;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/1316
public class GroupWord {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int numWords = Integer.parseInt(br.readLine());
		int cnt = 0;
		
		for(int i=0;i<numWords;i++){
			
			String word = br.readLine();
			boolean isGroupLetter = true;
			Set<String> letterSet = new HashSet<>();
			
			//aabbca
			for(int j=0;j<word.length();j++){
				String letter = word.substring(j,j+1);
				if(j>1){
					String prevLetter = word.substring(j-1,j);
					if(prevLetter.equals(letter)){
					
					}else {
						if(letterSet.contains(letter)){
							isGroupLetter=false;
						}else{
							letterSet.add(letter);
						}
					}
					
				}else{
					letterSet.add(letter);
				}
				/*
				if(j==word.length()-1){
					System.out.print("{");
					for(String str : letterSet){
						System.out.print(str+" ");
					}
					System.out.print("}\n");
				}
				
				 */
			}
			
			if(isGroupLetter) cnt++;
		}
		bw.append(String.valueOf(cnt));
		bw.flush();
		bw.close();
		br.close();
	}
}
