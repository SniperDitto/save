package pkg.daily;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Sum5 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int inputNum = Integer.parseInt(br.readLine());
		br.close();
		
		int head = 1;
		int tail = 1;
		int addNum = 1;
		int sum = 0;
		int count = 0;
		
		while(head<=inputNum) {
			while (sum <= inputNum) {
				sum+=addNum;
				addNum++;
				if(sum==inputNum) count++;
			}
			sum=0;
			head++;
			tail=head;
			addNum=head;
		}
		
		System.out.println(count);
	}
}
