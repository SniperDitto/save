package pkg.test;

public class Sorting {

	public static void main(String[] args) {
		
		int[] arr = {10, 11, 2, 5, 3, 3, 24, 15, 6, 9};
		int[] minMax = minMaxArr(arr);
		
		
		
	}
	
	public static int[] minMaxArr(int[] arr) {
		int[] result = new int[2];
		
		for(int i=0;i<arr.length;i++) {
			for(int j=arr.length-1;j>0;j--) {
				if(arr[j]<arr[j-1]) {
					int temp = arr[j];
					arr[j] = arr[j-1];
					arr[j-1] = temp;
				}
			}
			
		}
		
		result[0] = arr[0];
		result[1] = arr[arr.length-1];
		
		System.out.println("최소 : "+result[0]);
		System.out.println("최대 : "+result[1]);
		return result;
	}

}
