package pkg.Class2;

import java.io.*;
import java.util.StringTokenizer;

//https://www.acmicpc.net/problem/11866
public class Josephus {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		int N = Integer.parseInt(st.nextToken());
		int K = Integer.parseInt(st.nextToken());
		int[] delNumArr = new int[N];
		
		JosephusList j = new JosephusList(N);
		for(int i=2;i<=N;i++){
			j.addNum(i);
		}
		
		int cnt = 0;
		while (cnt<j.getSize()){
			delNumArr[cnt] = j.delNum(K);
			cnt++;
		}
		
		bw.flush();
		bw.close();
		br.close();
	}
}

class JosephusList{
	private JosephusNum start;
	private JosephusNum nextNum;
	private int size;
	
	public JosephusList(int size){
		this.start = new JosephusNum(1);
		this.nextNum = this.start;
		this.size = size;
	}
	
	public void addNum(int value){
		JosephusNum newNum = new JosephusNum(value);
		
		this.nextNum.setNext(newNum);
		newNum.setPrev(this.nextNum);
		this.nextNum = newNum;
		
		if(value==size){
			this.start.setPrev(newNum);
		}
	}
	
	public boolean isEmpty(){
		int tempSize = 1;
		while()
	}
	
	public int delNum(int count){
		int tempCount = 0;
		JosephusNum tempNum = this.start;
		while(!isEmpty()){
			tempCount++;
			if(tempCount==count){
				JosephusNum prev = tempNum.getPrev();
				JosephusNum next = tempNum.getNext();
				prev.setNext(next);
				next.setPrev(prev);
				this.start = next;
				break;
			}else{
				tempNum = tempNum.getNext();
			}
		}
		
		return tempNum.getVal();
	}
	
	public int getSize() {
		return size;
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
