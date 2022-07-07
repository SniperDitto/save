package pkg.Class2;

import java.io.*;
import java.util.LinkedList;
import java.util.Queue;

public class Card2 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int input = Integer.parseInt(br.readLine());
		Queue<Integer> q = new LinkedList<>();
		
		for(int i=1;i<=input;i++){
			if(input==1) q.offer(1);
			if(i%2==0){
				q.offer(i);
			}
		}
		
		if(input%2==0){
			while (q.size()!=1){
				q.poll();
				int nextNum = q.poll();
				q.offer(nextNum);
			}
		}else{
			while (q.size()!=1) {
				int nextNum = q.poll();
				q.offer(nextNum);
				q.poll();
			}
		}
		
		int lastNum = q.poll();
		bw.append(String.valueOf(lastNum));
		
		bw.flush();
		bw.close();
		br.close();
	}
}
