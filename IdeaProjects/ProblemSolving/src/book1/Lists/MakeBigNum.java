package book1.Lists;

import java.io.*;
import java.util.Deque;
import java.util.LinkedList;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/2812
public class MakeBigNum {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int length = Integer.parseInt(st.nextToken());
		int delCount = Integer.parseInt(st.nextToken());
		Deque<Integer> d = new LinkedList<>();
		
		String inputNum = br.readLine();
		for(int i=0;i<length;i++){
			int next = Integer.parseInt(inputNum.substring(i,i+1));
			if(d.isEmpty()){
				d.add(next);
			} else{
				int size = d.size();
				for(int j=0;j<size;j++){
					int num = d.pollLast();
					if(num>=next){
						d.addFirst(num);
					}else{
						if(delCount>0) {
							delCount--;
						}else{
							d.addFirst(num);
						}
					}
				}
				d.add(next);
			}
			
		}
		
		while(delCount>0){
			int min = d.peek();
			for(int i : d){
				if(min>i) min = i;
			}
			
			int size = d.size();
			for(int j=0;j<size;j++){
				int num = d.pollLast();
				if(num!=min){
					d.addFirst(num);
				}else{
					delCount--;
					if (delCount<=0) break;
				}
			}
		}
		
		while (!d.isEmpty()){
			bw.append(String.valueOf(d.poll()));
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
