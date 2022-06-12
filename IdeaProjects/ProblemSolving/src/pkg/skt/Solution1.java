package pkg.skt;

public class Solution1 {
	public static void main(String[] args) {
		int[] p = {2,5,3,1,4};
		int[] result = solution(p);
		for(int i : result){
			System.out.print(i+" ");
		}
	}
	
	public static int[] solution(int[] p) {
		int i = 0;
		int length = p.length;
		int[] answer = new int[length];
		
		while(i<length){
			int min = p[i];
			int minIdx = 0;
			for(int j=i;j<length;j++){
				if(min>p[j]){
					min=p[j];
					minIdx = j;
				}
			}
			if(min!=p[i]){
				int temp = p[i];
				p[i] = p[minIdx];
				p[minIdx] = temp;
				if(i!=minIdx){
					answer[i]++;
					answer[minIdx]++;
				}
			}
			i++;
		}
		
		return answer;
	}
}
