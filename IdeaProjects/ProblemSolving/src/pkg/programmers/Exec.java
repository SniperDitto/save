package pkg.programmers;

public class Exec {
	public static void main(String[] args) {
		ReportUser r = new ReportUser();
		String[] id_list = {"muzi", "frodo", "apeach", "neo"};
		String[] report = {"muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"};
		int k = 0;
		int[] result = r.solution(id_list, report, k);
		
		for(int i : result){
			System.out.print(i+" ");
		}
	}
}
