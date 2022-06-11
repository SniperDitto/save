package pkg.level;

import java.util.ArrayList;
import java.util.HashSet;

public class SelfNumber4 {
	public static void main(String[] args) {
		
		HashSet<Integer> selfNumArr = new HashSet<>();
		ArrayList<Integer> result = new ArrayList<>();
		
		for(int i=1;i<=10000;i++){
			int next = nextNumber(i);
			if(next<=10000) selfNumArr.add(next);
		}
		
		for(int i=1;i<=10000;i++){
			if(!selfNumArr.contains(i)) result.add(i);
		}
		
		for(int i : result){
			System.out.println(i);
		}
	
	}
	
	public static int nextNumber(int i){
		String inputStr = Integer.toString(i);
		int length = inputStr.length();
		int result = i;
		
		for(int j=0;j<length;j++){
			result += Integer.parseInt(inputStr.substring(j,j+1));
		}
		
		return result;
	}
	
}
