package pkg.coconetest;

public class Problem3 {
	public String solution(String encrypted_text, String key, int rotation) {
		String answer = "";
		int l=encrypted_text.length();
		int[] encArr = new int[l];
		int[] keyArr = new int[l];
		int[] tempArr = new int[l];
		
		for(int i=0;i<l;i++){
			encArr[i]=encrypted_text.charAt(i);
			//아스키코드 a=97이 1을 나타내므로
			keyArr[i]=key.charAt(i)-96;
			System.out.println(encArr[i]+" "+keyArr[i]);
		}
		
		// rotation에 따라 반대로 회전
		for(int i=0;i<l;i++){
			if(rotation>0){
				tempArr[i] = encArr[(l-(-1*rotation-i))%l];
			}else if(rotation<0){
				tempArr[i] = encArr[(i+rotation*-1)%l];
			}
		}
		
		// keyArr의 인덱스에 대응하는 자리에 역으로 빼줘야 한다
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<l;i++){
			tempArr[i] -= keyArr[i];
			if(tempArr[i]<97) tempArr[i]+=26;
			if(tempArr[i]>122) tempArr[i]-=26;
			sb.append((char)tempArr[i]);
			System.out.print(tempArr[i]+" ");
		}
		System.out.println();
		
		answer = String.valueOf(sb);
		return answer;
	}
}
