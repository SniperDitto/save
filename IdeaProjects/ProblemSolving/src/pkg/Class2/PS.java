package pkg.Class2;

import java.io.*;
import java.util.StringTokenizer;
//https://www.acmicpc.net/problem/9012
public class PS {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int inputCaseNum = Integer.parseInt(br.readLine());
		
		for(int i=0;i<inputCaseNum;i++){
			StringTokenizer st = new StringTokenizer(br.readLine());
			while(st.hasMoreTokens()) {
				String str = st.nextToken();
				int length = str.length();
				int left = 0;
				int right = 0;
				for(int j=0;j<length;j++){
					String chkStr = str.substring(j,j+1);
					if (chkStr.equals("(")) {
						//왼쪽괄호가 나오면 짝(오른쪽괄호)찾기
						left++;
					}else if(chkStr.equals(")")){
						right++;
					}
					if(chkStr.equals(")") && left!=0){
						left--;
						right--;
					}
				}
				if(left==0 && right==0){
					bw.write("YES");
				}else{
					bw.write("NO");
				}
				bw.write("\n");
			}
		}
		bw.flush();
		bw.close();
		br.close();
	}
}
