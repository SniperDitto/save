package pkg.daily;

import java.io.*;
import java.util.*;
//https://www.acmicpc.net/problem/1940
public class MakeArmor {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		int numMaterial = Integer.parseInt(br.readLine());
		int numNeed = Integer.parseInt(br.readLine());
		StringTokenizer st = new StringTokenizer(br.readLine());
		int[] materials = new int[numMaterial];
		
		int head = 0;
		int tail = 1;
		int sum;
		int count = 0;
		
		for(int i=0;i<numMaterial;i++){
			materials[i] = Integer.parseInt(st.nextToken());
		}
		
		while(head<numMaterial){
			while(tail<numMaterial && head<tail){
				sum = materials[head] + materials[tail];
				if(sum==numNeed) {
					count++;
				}
				tail++;
			}
			head++;
			tail=head+1;
		}
		
		bw.append(String.valueOf(count));
		bw.flush();
		bw.close();
		br.close();
	}
}
