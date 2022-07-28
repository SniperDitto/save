package book1.Lists;

import java.io.*;
import java.util.Deque;
import java.util.LinkedList;
import java.util.StringTokenizer;

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
				while (!d.isEmpty() && delCount>0){
					if(d.peekLast()<next){
						d.pollLast();
						delCount--;
					}else if(d.peekLast()>=next){
						break;}
//					}else{
//						d.pollLast();
//						delCount--;
//						break;
//					}
				}
				d.add(next);
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
