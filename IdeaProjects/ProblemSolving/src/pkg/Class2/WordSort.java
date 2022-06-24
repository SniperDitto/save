package pkg.Class2;

import java.io.*;
import java.util.*;
//https://www.acmicpc.net/problem/1181
public class WordSort {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int caseNum = Integer.parseInt(br.readLine());
		Set<String> inputWords = new HashSet<>();
		
		for(int i=0;i<caseNum;i++){
			inputWords.add(br.readLine());
		}
		
		String[] words = new String[inputWords.size()];
		int idx = 0;
		for(String s : inputWords){
			words[idx] = s;
			idx++;
		}
		
		Arrays.sort(words, new Comparator<String>() {
			@Override
			public int compare(String o1, String o2) {
				int length1 = o1.length();
				int length2 = o2.length();
				if(length1<length2){
					return -1;
				}else if(length1>length2){
					return 1;
				}else if(length1==length2){
					return o1.compareTo(o2);
				}
				return 0;
			}
		});
		
		
		for(String s : words){
			bw.append(String.valueOf(s));
			bw.append("\n");
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
