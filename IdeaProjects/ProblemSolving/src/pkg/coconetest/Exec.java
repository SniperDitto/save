package pkg.coconetest;

import pkg.skttest.Solution1;

import java.util.HashMap;

public class Exec {
	public static void main(String[] args) {
		Problem1_1 p1 = new Problem1_1();
		int[][] p = {{1, 3}, {3, 1}, {3, 5}, {2, 5},{5, 3}};
		System.out.println(p1.solution(p));
		
		/*HashMap map = new HashMap();
		map.put(1, "kim");
		map.put(1, "lee");
		map.put(1, "Jung");
		map.put(1, "Park");
		
		System.out.println(map.size());
		System.out.println(map.get(1));
		 */
	}
}