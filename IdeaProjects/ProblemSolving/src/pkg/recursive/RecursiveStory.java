package pkg.recursive;

import java.io.*;

public class RecursiveStory {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int repeatNum = Integer.parseInt(br.readLine());
		
		String start = "어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.\n";
		String strStory = "";
		
		strStory += story(repeatNum, strStory, 0);
		
		String end = "라고 답변하였지.\n";
		for(int i=0;i<repeatNum;i++){
			strStory += makeTab(repeatNum-i);
			strStory = strStory + end;
		}
		
		bw.append(start);
		bw.append(strStory);
		bw.append(end);
		bw.flush();
		bw.close();
		br.close();
	}
	
	public static String story(int repeatNum, String prevStory, int tabNum){
		String nowStory = prevStory;
		
		String ask = "\"재귀함수가 뭔가요?\"\n";
		nowStory = nowStory + makeTab(tabNum) + ask;
		
		if(repeatNum==0){
			String center = "\"재귀함수는 자기 자신을 호출하는 함수라네\"\n";
			nowStory = nowStory + makeTab(tabNum) + center;
			return nowStory;
		}else{
			
			String repeat1 ="\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.\n" ;
			String repeat2 = "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.\n" ;
			String repeat3 = "그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\"\n";
			
			nowStory += makeTab(tabNum) + repeat1;
			nowStory += makeTab(tabNum) + repeat2;
			nowStory += makeTab(tabNum) + repeat3;
			
			return story(repeatNum-1, nowStory, tabNum+1);
		}
		
		
	}
	
	public static String makeTab(int num){
		String result = "";
		for(int i=0;i<num;i++){
			result += "____";
		}
		return result;
	}
	
}
