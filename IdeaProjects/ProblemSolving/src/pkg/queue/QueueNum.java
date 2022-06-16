package pkg.queue;

public class QueueNum {
	private int number;
	private QueueNum nextNumber;
	
	public QueueNum(int number){
		this.number = number;
		this.nextNumber = null;
	}
	
	public int getNumber(){
		return this.number;
	}
	
	public QueueNum getNextNumber(){
		return this.nextNumber;
	}
	
	public void setNextNumber(QueueNum nextNumber){
		this.nextNumber = nextNumber;
	}
	
}
