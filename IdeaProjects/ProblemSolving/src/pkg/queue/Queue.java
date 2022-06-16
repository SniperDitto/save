package pkg.queue;

public class Queue {
	//head(입구) -> tail(출구)
	private QueueNum head;
	private QueueNum tail;
	
	public Queue(){
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
		QueueNum num = new QueueNum(X);
		if(isEmpty()){
			this.head = this.tail = num;
		}else{
			head.setNextNumber(num);
			head=num;
		}
	}
	
	public QueueNum pop(){
		if(isEmpty()){
			System.out.println(-1);
			return null;
		}else{
			QueueNum lastNum = tail;
			System.out.println(lastNum.getNumber());
			tail=tail.getNextNumber();
			return lastNum;
		}
	}
	
	public void front(){
		if(isEmpty()){
			System.out.println(-1);
		}else{
			System.out.println(head.getNumber());
		}
	}
	
	public void back(){
		if(isEmpty()){
			System.out.println(-1);
		}else{
			System.out.println(tail.getNumber());
		}
	}
	
	public int size(){
		int size = 0;
		QueueNum tempHead = head;
		QueueNum tempTail = tail;
		if(isEmpty()){
			System.out.println(size);
		}
		else{
			System.out.println(1);
			size=1;
			while (tempTail!=tempHead){
				tail=tail.getNextNumber();
				size++;
			}
		}
		return size;
	}

}
