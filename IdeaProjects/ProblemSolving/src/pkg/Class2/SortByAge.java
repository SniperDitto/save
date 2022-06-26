package pkg.Class2;

import java.io.*;
import java.util.*;
//https://www.acmicpc.net/problem/10814
public class SortByAge {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int inputCaseNum = Integer.parseInt(br.readLine());
		Map<Integer, ArrayList<String>> memberMap = new HashMap<>();
		Set<Integer> ageSet = new TreeSet<>();
		ArrayList<String> nameArr;
		
		for(int i=0;i<inputCaseNum;i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			int age = Integer.parseInt(st.nextToken());
			String name = st.nextToken();
			
			if(memberMap.keySet().contains(age)){
				nameArr = memberMap.get(age);
				nameArr.add(name);
			}else{
				nameArr = new ArrayList<>();
				nameArr.add(name);
				memberMap.put(age,nameArr);
				ageSet.add(age);
			}
		}
		
		for(int a : ageSet){
			nameArr = memberMap.get(a);
			for(String s : nameArr){
				bw.append(String.valueOf(a));
				bw.append(" ");
				bw.append(String.valueOf(s));
				bw.append("\n");
			}
		}
		
		bw.flush();
		bw.close();
		br.close();
		
	}
}
