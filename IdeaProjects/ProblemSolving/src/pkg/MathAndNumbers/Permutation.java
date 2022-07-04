package pkg.MathAndNumbers;

import java.util.ArrayList;

public class Permutation {
	
	public static void main(String[] args) {
		int[] arr = {1,2,3,4};
		
		permutation(arr,0);
		
		for(int[] i : perArr){
			for(int j : i){
				System.out.print(j+" ");
			}
			System.out.print("\n");
		}
		
	}
	
	static ArrayList<int[]> perArr = new ArrayList<>();
	
	public static void permutation(int[] arr, int depth){
		int length = arr.length;
		
		if(depth==length) {
			//printArr(arr);
			perArr.add(arr.clone());
			return;
		}
		
		for(int i=depth;i<length;i++){
			swap(arr, i, depth);
			permutation(arr,depth+1);
			swap(arr, i, depth);
		}
		
	}
	
	public static void swap(int[] arr, int i, int j){
		int temp = arr[i];
		arr[i] = arr[j];
		arr[j] = temp;
	}
	
	/*
	public static void printArr(int[] arr){
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		for(int i : arr){
			sb.append(i);
			if(i!=arr[arr.length-1]){
				sb.append(", ");
			}
		}
		sb.append("]");
		System.out.println(sb);
	}
	 */
	 
	
}
