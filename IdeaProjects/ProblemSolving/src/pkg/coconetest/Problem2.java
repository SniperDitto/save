package pkg.coconetest;

public class Problem2 {
	public int solution(int[] estimates, int k) {
		int answer = estimates[0];
		
		
		//sum이 최대가 되는 구간의 sum을 return (max sum=answer)
		//구간 크기 k
		int tempSum = 0;
		int head = 0;
		int tail = head+k-1;
		for(int i=head;i<=tail;i++){
			tempSum+=estimates[i];
		}
		answer = tempSum;
		
		while(head+k<estimates.length){
			tempSum -= estimates[head];
			head++;
			tail++;
			tempSum += estimates[tail];
			
			if(tempSum>answer) answer = tempSum;
		}
		
		
		return answer;
	}
}
