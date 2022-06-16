package pkg.queue;

import java.io.*;
import java.util.StringTokenizer;

public class MakeQueue {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int inputNum = Integer.parseInt(br.readLine());
		Queue2 q = new Queue2();
		
		for(int i=0;i<inputNum;i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			String runMethod = st.nextToken();
			if(runMethod.equals("push")){
				int number = Integer.parseInt(st.nextToken());
				q.push(number);
			}else if(runMethod.equals("pop")){
				q.pop();
			}else if(runMethod.equals("size")){
				q.size();
			}else if(runMethod.equals("empty")){
				q.empty();
			}else if(runMethod.equals("front")){
				q.front();
			}else if(runMethod.equals("back")){
				q.back();
			}
		}
		
		br.close();
	}
}

class Queue2 {
	//head(입구) -> tail(출구)
	private QueueNum2 head;
	private QueueNum2 tail;
	
	public Queue2(){
		this.head = null;
		this.tail = null;
	}
	
	public boolean isEmpty(){
		if(this.head==null && this.tail==null){
			return true;
		}else{
			return false;
		}
	}
	
	public void empty(){
		if(isEmpty()){
			System.out.println(1);
		}else {
			System.out.println(0);
		}
	}
	
	public void push(int X){
		QueueNum2 newNum = new QueueNum2(X);
		if(isEmpty()){
			this.head = newNum;
			this.tail = newNum;
		}else{
			this.head.setNext(newNum);
			this.head=newNum;
		}
	}
	
	public QueueNum2 pop(){
		if(isEmpty()){
			System.out.println(-1);
			return null;
		}else{
			QueueNum2 popNum = this.tail;
			System.out.println(popNum.getNumber());
			if(this.tail.getNext()==null){
				this.head=null;
			}
			this.tail=this.tail.getNext();
			return popNum;
		}
	}
	
	public void front(){
		//나오는쪽
		if(isEmpty()){
			System.out.println(-1);
		}else{
			System.out.println(this.tail.getNumber());
		}
	}
	
	public void back(){
		//들어가는쪽
		if(isEmpty()){
			System.out.println(-1);
		}else{
			System.out.println(this.head.getNumber());
		}
	}
	
	public int size(){
		int size = 0;
		QueueNum2 tempHead = this.head;
		QueueNum2 tempTail = this.tail;
		if(!isEmpty()){
			size = 1;
			while (tempTail!=tempHead && tempTail!=null && tempHead!=null){
				tempTail = tempTail.getNext();
				size++;
			}
		}
		System.out.println(size);
		return size;
	}
	
}

class QueueNum2 {
	private int number;
	private QueueNum2 next;
	
	public QueueNum2(int number){
		this.number = number;
		this.next = null;
	}
	
	public int getNumber(){
		return this.number;
	}
	
	public QueueNum2 getNext(){
		return this.next;
	}
	
	public void setNext(QueueNum2 next){
		this.next = next;
	}
	
}
