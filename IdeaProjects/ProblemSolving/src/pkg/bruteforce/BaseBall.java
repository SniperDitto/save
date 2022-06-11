package pkg.bruteforce;

import java.io.*;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class BaseBall {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		//123부터 987까지
		//0들어가는수제외하고 추가
		int[] chkArr = new int[504];
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
				
				chkArr[index] = i;
				index++;
			}
			
		}
		index=0;
		
		
		//입력받기
		int inputCaseNum = Integer.parseInt(br.readLine());
		int[] tempAnswerArr = new int[504];
		int[] answerArr = new int[504];
		int[] resultArr = new int[504];
		
		for(int i=0;i<inputCaseNum;i++){
			//입력한 수에 대해 모든 수들의 strike, ball 구해서
			//일치하는 strike, ball을 가진 수를 후보숫자 배열에 추가
			StringTokenizer st = new StringTokenizer(br.readLine());
			int caseNum = Integer.parseInt(st.nextToken());
			int strike = Integer.parseInt(st.nextToken());
			int ball = Integer.parseInt(st.nextToken());
			int[][] chkStrBall = new int[504][3];//모든 숫자에 대해 strike, ball 저장할 배열
			//[체크할수, strike수, ball수]
			index=0;
			
			
			String caseStr = Integer.toString(caseNum);
			for(int j=0;j<504;j++){
				//모든 숫자에 대해 입력값과 비교해 strike, ball 판단해 배열에 저장
				chkStrBall[j][0] = chkArr[j];
				String chkNum = Integer.toString(chkArr[j]);
				
				//index, value 일치 시 strike
				//value만 일치 시 ball
				for(int k=0;k<3;k++){
					for(int n=0;n<3;n++){
						if(caseStr.substring(k,k+1).equals(chkNum.substring(n,n+1))){//value일치
							if(k==n){//index일치
								chkStrBall[j][1]++;
							}else{
								chkStrBall[j][2]++;
							}
							
						}
					}
				}
				
				if(chkStrBall[j][1]==strike && chkStrBall[j][2]==ball){
					tempAnswerArr[index]=chkArr[j];
					index++;
					
				}
				
			}
			
			
			
			
			
			
			if(i==0){
				answerArr = tempAnswerArr;
				resultArr = answerArr;
			}else{
				answerArr = resultArr;
				resultArr = new int[504];
				//교집합구하기
				int idx = 0;
				for(int num : answerArr){
					for(int num2 : tempAnswerArr){
						if(num==num2 && num!=0){
							
							resultArr[idx] = num;
							idx++;
						}
					}
				}
			}
			
			
			
			System.out.println("tempArr");
			for(int n : tempAnswerArr){
				
				System.out.print(n+" ");
			}System.out.println();
			System.out.println("answerArr");
			for(int n : answerArr){
				
				System.out.print(n+" ");
			}System.out.println();
			System.out.println("resultArr");
			for(int n : resultArr){
				
				System.out.print(n+" ");
			}System.out.println();
			
			
			tempAnswerArr = new int[504];
		}
		
		int count = 0;
		for(int num : resultArr){
			if(num!=0) count++;
		}
		
		
		bw.write(String.valueOf(count));
		bw.flush();
		bw.close();
		br.close();
	}
}
