package pkg.queue;

import java.io.*;
import java.util.Deque;
import java.util.LinkedList;
import java.util.StringTokenizer;

public class MakeQueue2 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		
		
		int inputNum = Integer.parseInt(br.readLine());
		Deque<Integer> q = new LinkedList<>();
		int lastVal = 0;
		
		for(int i=0;i<inputNum;i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			String runMethod = st.nextToken();
			
			switch (runMethod){
				case "push":
					int number = Integer.parseInt(st.nextToken());
					lastVal = number;
					q.add(number);
					break;
				case "pop":
					if(q.isEmpty()){
						bw.append(String.valueOf(-1));
						bw.append("\n");
					}else{
						bw.append(String.valueOf(q.poll()));
						bw.append("\n");
					}
					break;
				case "size":
					bw.append(String.valueOf(q.size()));
					bw.append("\n");
					break;
				case "empty":
					if(q.isEmpty()){
						bw.append(String.valueOf(1));
						bw.append("\n");
					}else{
						bw.append(String.valueOf(0));
						bw.append("\n");
					}
					break;
				case "front":
					if(q.isEmpty()){
						bw.append(String.valueOf(-1));
						bw.append("\n");
					}else {
						bw.append(String.valueOf(q.peek()));
						bw.append("\n");
					}
					break;
				case "back":
					if(q.isEmpty()){
						bw.append(String.valueOf(-1));
						bw.append("\n");
					}else{
						bw.append(String.valueOf(lastVal));
						bw.append("\n");
					}
					break;
			}
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}
