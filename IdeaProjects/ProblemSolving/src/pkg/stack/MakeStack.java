package pkg.stack;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class MakeStack {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int inputNum = Integer.parseInt(br.readLine());
		Stack s = new Stack();
		
		for(int i=0;i<inputNum;i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			String runMethod = st.nextToken();
			if(runMethod.equals("push")){
				int number = Integer.parseInt(st.nextToken());
				s.push(number);
			}else if(runMethod.equals("pop")){
				s.pop();
			}else if(runMethod.equals("size")){
				s.size();
			}else if(runMethod.equals("empty")){
				s.empty();
			}else if(runMethod.equals("top")){
				s.top();
			}
		}
		
		br.close();
	}
	
	
}

class Stack{
	
	private StackNum exitNum;
	
	public Stack(){
		this.exitNum = null;
	}
	
	public boolean isEmpty(){
		if(this.exitNum==null){
			return true;
		}else{
			return false;
		}
	}
	
	//top: 스택의 가장 위에 있는 정수를 출력한다. 만약 스택에 들어있는 정수가 없는 경우에는 -1을 출력한다.
	
	public void empty(){
		if(isEmpty()){
			System.out.println(1);
		}else{
			System.out.println(0);
		}
	}
	
	public void push(int X){
		StackNum newNum = new StackNum(X);
		if(!isEmpty()){
			newNum.setNext(this.exitNum);
		}
		this.exitNum = newNum;
	}
	
	public StackNum pop(){
		if(isEmpty()){
			System.out.println(-1);
			return null;
		}else {
			StackNum tempNum = this.exitNum;
			this.exitNum = tempNum.getNext();
			System.out.println(tempNum.getNumber());
			return tempNum;
		}
	}
	
	public int size(){
		int size=0;
		if(!isEmpty()){
			StackNum tempNum = this.exitNum;
			while(tempNum!=null){
				tempNum = tempNum.getNext();
				size++;
			}
		}
		System.out.println(size);
		return size;
	}
	
	public void top(){
		if(isEmpty()){
			System.out.println(-1);
		}else{
			System.out.println(this.exitNum.getNumber());
		}
	}

}

class StackNum{
	private int number;
	private StackNum next;
	
	public StackNum(int number){
		this.number = number;
		this.next = null;
	}
	
	public int getNumber(){
		return this.number;
	}
	
	public StackNum getNext(){
		return this.next;
	}
	
	public void setNext(StackNum next){
		this.next = next;
	}
	
}


