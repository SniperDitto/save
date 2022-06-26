package pkg.coconetest;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Problem1 {
	public int solution(int [][] p)
	{
		int answer = 0;
		int pLength = p.length;
		Map<Integer, Set<Integer>> memberMap = new HashMap<>();
		
		//데이터 저장하기
		for(int i=0;i<pLength;i++){
			int memA = p[i][0];
			int memB = p[i][1];
			Set<Integer> s;
			if(memberMap.get(memA)==null){
				//a가 저장되어있지 않은 경우
				s = new HashSet<>();
				s.add(memB);
				memberMap.put(memA,s);
			}else{
				//a가 이미 저장된 경우
				s = memberMap.get(memA);
				s.add(memB);
			}
		}
		
		//서로 선호하는 상대인지 체크
		for(int key : memberMap.keySet()){
			//memberMap에 저장된 사람 a에 대해
			System.out.print(key+" : ");
			for(int wanted : memberMap.get(key)){
				System.out.print(wanted+" ");
				//a가 선호하는 상대의 목록
				if(memberMap.get(wanted)==null){
					//상대가 memberMap에 저장되어있지 않음
				}else if(memberMap.get(wanted).contains(key)){
					//상대가 저장되어 있고 그 상대의 선호목록 중 a가 있다면
					answer++;
				}
			}
			System.out.print("\n");
		}
		
		return answer/2;
	}
}
