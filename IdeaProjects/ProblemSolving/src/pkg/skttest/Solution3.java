package pkg.skttest;

public class Solution3 {
	public static void main(String[] args) {
	
	}
	
	public static int[] solution(int n, String[] plans, String[] clients) {
		int[] answer = {};
		//n : 부가서비스 수
		//plans : 요금제들 ["데이터양 부가서비스1 2 3", "데이터양 부가서비스1 5" ... ]
		//clients : 고객 요구 ["데이터양 원하는부가서비스1 2 3", ...]
		
		int numClients = clients.length;
		int numPlans = plans.length;
		
		for(int i=0;i<numPlans;i++){
			String[] strPlan = plans[i].split(" ");
			int data = Integer.parseInt(strPlan[0]);
			int[] services = new int[strPlan.length-1];
			for(int j=1;j<strPlan.length;j++){
				services[j-1] = Integer.parseInt(strPlan[j]);
			}
			
		}
		
		
		return answer;
	}
}
