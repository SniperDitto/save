package pkg.programmers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

public class ReportUser {
	public int[] solution(String[] id_list, String[] report, int k) {
		Map<String, ArrayList<String>> reportMap = new HashMap<>();
		//회원아이디, 신고한사람들배열
		
		int reportLength = report.length;
		for(int i=0;i<reportLength;i++){
			StringTokenizer st = new StringTokenizer(report[i]);
			String targetID = st.nextToken();
			String reportID = st.nextToken();
			ArrayList<String> arr = null;
			if(!reportMap.containsKey(reportID)) {
				arr = new ArrayList<>();
			}else{
				arr = reportMap.get(reportID);
			}
			arr.add(targetID);
			reportMap.put(reportID,arr);
		}
		
		int memberLength = id_list.length;
		int[] answer = new int[memberLength];
		
		int idx = 0;
		//여기부터수정필요
		for(String id : id_list){
			for(String reportID : reportMap.keySet()){
				int reportCnt = reportMap.get(reportID).size();
				if(id.equals(reportID) && reportCnt>=k) {
					answer[idx]++;
				}
			}
			idx++;
		}
		
		return answer;
	}
}
