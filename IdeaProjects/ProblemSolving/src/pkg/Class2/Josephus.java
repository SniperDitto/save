package pkg.Class2;

import java.io.*;
import java.util.Deque;
import java.util.LinkedList;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/11866
public class Josephus {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int N = Integer.parseInt(st.nextToken());//총인원수
		int K = Integer.parseInt(st.nextToken());//제외간격
		
		bw.append("<");
		Deque<Integer> d = new LinkedList<>();
		
		int limit = N/K;
		for(int i=1;i<=N;i++){
			if(i%K==0){
				bw.append(String.valueOf(i));
				bw.append(", ");
			}else{
				d.add(i);
			}
		}
		
		int count = 0;
		while(d.size()>0){
			int i = d.poll();
			count++;
			if(count==K){
				bw.append(String.valueOf(i));
				if(d.size()!=1){
					bw.append(", ");
				}
				count=0;
			}else{
				d.add(i);
			}
		}
		
		bw.append(">");
		bw.flush();
		bw.close();
		br.close();
	}
}


