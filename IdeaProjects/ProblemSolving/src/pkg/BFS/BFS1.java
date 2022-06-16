package pkg.BFS;

import java.io.*;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

public class BFS1 {
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
		StringTokenizer st = new StringTokenizer(br.readLine());
		
		int vertex = Integer.parseInt(st.nextToken());
		int edge = Integer.parseInt(st.nextToken());
		int start = Integer.parseInt(st.nextToken());
		int[][] adjMatrix = new int[vertex][vertex];//인접행렬
		LinkedList<Integer>[] adjList = new LinkedList[vertex+1];//인접리스트
		
		int[] visited = new int[vertex+1];//방문목록
		Queue<Integer> q = new LinkedList<>();
		
		for(int i=0;i<edge;i++){
			StringTokenizer st2 = new StringTokenizer(br.readLine());
			int idx1 = Integer.parseInt(st2.nextToken())-1;
			int idx2 = Integer.parseInt(st2.nextToken())-1;
			
			adjMatrix[idx1][idx2]=1;
			adjMatrix[idx2][idx1]=1;
			
		}
		
		for(int i=0;i<vertex;i++){
			for(int j=0;j<vertex;j++){
				System.out.printf("%d ",adjMatrix[i][j]);
			}
			System.out.println();
		}
		
		
		bw.flush();
		bw.close();
		br.close();
	}
}
