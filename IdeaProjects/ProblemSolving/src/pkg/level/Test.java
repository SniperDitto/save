package pkg.level;

import java.util.ArrayList;

public class Test {
	public static void main(String[] args) {
		ArrayList<Integer> a = new ArrayList<>();
		int index = 0;
		for (int i=123;i<988;i++){
			boolean isOk = true;
			String chkStr = Integer.toString(i);
			if(chkStr.contains("0")){
				continue;
			}
			a : for(int j=0;j<3;j++){
				//111 222 등 중복되는수들 제외
				String s1 = chkStr.substring(j,j+1);
				for(int k=j+1;k<3;k++){
					String s2 = chkStr.substring(k,k+1);
					if(s1.equals(s2)){
						isOk = false;
						break a;
					}
				}
			}
			if(isOk){
				//chkArr[index] = i;
				a.add(i);
				index++;
			}
			
		}
		

	}
	
	
}
