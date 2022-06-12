package pkg.Class2;

import java.io.*;
import java.util.SortedSet;
import java.util.TreeSet;

public class Sort {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int inputCnt = Integer.parseInt(br.readLine());
		
		SortedSet<Integer> numbers = new TreeSet<>();
		
		for(int i=0;i<inputCnt;i++){
			numbers.add(Integer.parseInt(br.readLine()));
		}
		
		for(int n : numbers){
			bw.write(String.valueOf(n));
			bw.write("\n");
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
