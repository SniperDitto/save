package pkg.Class2;

import java.io.*;
import java.util.StringTokenizer;

public class Josephus {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int N = Integer.parseInt(st.nextToken());
		int K = Integer.parseInt(st.nextToken());
		
		JosephusNum startNum = new JosephusNum(1);
		int cnt = 1;
		
		for(int i=2;i<N;i++){
		
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}

class JosephusNum{
	private int val;
	private JosephusNum prev;
	private JosephusNum next;
	
	public JosephusNum(int val){
		this.val = val;
		this.prev = null;
		this.next = null;
	}
	
	public int getVal() {
		return val;
	}
	
	public JosephusNum getPrev() {
		return prev;
	}
	
	public void setPrev(JosephusNum prev) {
		this.prev = prev;
	}
	
	public JosephusNum getNext() {
		return next;
	}
	
	public void setNext(JosephusNum next) {
		this.next = next;
	}
}
