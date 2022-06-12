package pkg.skt;

public class Solution2 {
	public static void main(String[] args) {
		int[] periods = {24, 59, 59, 60};
		int[][] payments = {
				{50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000},
				{50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000},
				{350000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000},
				{50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000, 50000}
		};
		int[] estimates = {350000, 50000, 40000, 50000};
		
		int[] ans = solution(periods, payments, estimates);
		System.out.println(ans[0]+" "+ans[1]);
		
	}
	
	public static int[] solution(int[] periods, int[][] payments, int[] estimates) {
		int[] answer = {0,0};
		
		int numCustomers = periods.length;
		for(int i=0;i<numCustomers;i++){
			int per = periods[i];
			
			long price = 0;
			for(int j=0;j<12;j++){
				price += payments[i][j];
			}
			
			boolean isVIPnow = false;
			//현재 vip인지 일반고객인지 판단
			if(per>=24 && per<60 && price>=900000){
				isVIPnow = true;
			}else if(per>=60 && price>=600000){
				isVIPnow = true;
			}
			
			long estPrice = price+estimates[i]-payments[i][0];
			boolean isVIPnext = false;
			per++;
			if(per>=24 && per<60 && estPrice>=900000){
				isVIPnext = true;
			}else if(per>=60 && estPrice>=600000){
				isVIPnext = true;
			}
			
			if(isVIPnow && !isVIPnext){
				answer[1]++;
			}
			else if(!isVIPnow && isVIPnext){
				answer[0]++;
			}
		}
		return answer;
	}
}
