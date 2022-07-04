package pkg.queue;

import java.io.*;
import java.util.StringTokenizer;

public class MakeDeque {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int inputNum = Integer.parseInt(br.readLine());
		Deque d = new Deque();
		
		for(int i=0;i<inputNum;i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			String runMethod = st.nextToken();
			if(runMethod.equals("push_front")){
				int number = Integer.parseInt(st.nextToken());
				d.pushFront(number);
			}else if(runMethod.equals("push_back")){
				int number = Integer.parseInt(st.nextToken());
				d.pushBack(number);
			}else if(runMethod.equals("pop_front")){
				bw.append(String.valueOf(d.popFront()));
				bw.append("\n");
			}else if(runMethod.equals("pop_back")){
				bw.append(String.valueOf(d.popBack()));
				bw.append("\n");
			}else if(runMethod.equals("size")){
				bw.append(String.valueOf(d.size()));
				bw.append("\n");
			}else if(runMethod.equals("empty")){
				bw.append(String.valueOf(d.empty()));
				bw.append("\n");
			}else if(runMethod.equals("front")){
				bw.append(String.valueOf(d.getFront()));
				bw.append("\n");
			}else if(runMethod.equals("back")){
				bw.append(String.valueOf(d.getBack()));
				bw.append("\n");
			}
		}
		
		br.close();
		bw.flush();
		bw.close();
	}
}

class Deque{
	private DequeNum front;
	private DequeNum back;
	
	public Deque(){
		this.front = null;
		this.back = null;
	}
	
	public boolean isEmpty(){
		if(this.front == null && this.back ==null){
			return true;
		}else{
			return false;
		}
	}
	
	public int empty(){
		if(isEmpty()) return 1;
		else return 0;
	}
	
	public void pushFront(int X){
		DequeNum newNum = new DequeNum(X);
		if(isEmpty()){
			this.front = newNum;
			this.back = newNum;
		}else{
			this.front.setPrev(newNum);
			newNum.setNext(this.front);
			this.front = newNum;
		}
	}
	
	public void pushBack(int X){
		DequeNum newNum = new DequeNum(X);
		if(isEmpty()){
			this.front = newNum;
			this.back = newNum;
		}else{
			this.back.setNext(newNum);
			newNum.setPrev(this.back);
			this.back = newNum;
		}
	}
	
	public int popFront(){
		if(isEmpty()){
			return -1;
		}else{
			int popVal = this.front.getNum();
			DequeNum nextFront = this.front.getNext();
			if(this.front.getNext()==null){
				this.back=null;
			}else{
				nextFront.setPrev(null);
			}
			this.front = nextFront;
			return popVal;
		}
	}
	
	public int popBack(){
		if(isEmpty()){
			return -1;
		}else{
			int popVal = this.back.getNum();
			DequeNum nextBack = this.back.getPrev();
			if(this.back.getPrev()==null){
				this.front=null;
			}
			else{
				nextBack.setNext(null);
			}
			this.back = nextBack;
			return popVal;
		}
	}
	
	public int size(){
		int cnt = 0;
		DequeNum tempFront = this.front;
		DequeNum tempBack = this.back;
		if(!isEmpty()){
			cnt = 1;
			while (tempFront!=tempBack && tempBack!=null && tempFront!=null){
				tempFront = tempFront.getNext();
				cnt++;
			}
		}
		return cnt;
	}
	
	public int getFront(){
		int frontNum;
		frontNum = (isEmpty())? -1 : this.front.getNum();
		return frontNum;
	}
	
	public int getBack(){
		int backNum;
		backNum = (isEmpty())? -1 : this.back.getNum();
		return backNum;
	}
	
}

class DequeNum {
	
	private int num;
	private DequeNum prev;
	private DequeNum next;
	
	public DequeNum(int num){
		this.num = num;
		this.prev = null;
		this.next = null;
	}
	
	public int getNum() {
		return num;
	}
	
	public DequeNum getPrev() {
		return prev;
	}
	
	public DequeNum getNext() {
		return next;
	}
	
	public void setPrev(DequeNum prev) {
		this.prev = prev;
	}
	
	public void setNext(DequeNum next) {
		this.next = next;
	}
}
