
public class Condition {

	public static void main(String[] args) {
		
		//조건문
		//if & switch case
		//js와 문법 같다
		//----------------------------------------
		
		int a=14;//call by value
		int b=a;
		System.out.println(a);
		System.out.println(b);
		a=17;
		System.out.println(a);
		System.out.println(b);
		a=14;
		//숫자들 : call by value, stack 영역 사용
		// byte, short, char, int, long, float, double
		if(a==b) {
			System.out.println("a=b");
		}
		else {
			System.out.println("a!=b");
		}
		//------------------------------
		String str1 = "abcd";
		String str2 = str1;
		System.out.println("str1 : "+str1);
		System.out.println("str2 : "+str2);
		str1 = "asdfasdf";
		System.out.println(str1);
		System.out.println(str2);
		//String은 stack 영역 사용 불가
		//원래는 String str1 = new String();처럼 선언해야 하나
		//편의상 string만 저렇게 사용할 수 있도록 함
		if(str1==str2) {
			System.out.println("str1=str2");
		}
		else {
			System.out.println("str1!=str2");
		}
		
		//object 비교
		Object obj1 = new Object();
		Object obj2 = obj1;
		if(obj1.equals(obj2)) {
			System.out.println("obj1=obj2");
		}
		else {
			System.out.println("obj1!=obj2");
		}
		
		//일반적으로 if문에서의 == 는
		//call by value가 같음을 의미
		//두 객체를 정확히 비교하려면(reference)
		//다른 방법이 필요
		
		//---------------------------------------
		
		//for, while, do while, foreach - 배열&객체
		String strResult = "";
		int intSum = 0;
		for(int i=0;i<=100;i++) {
			if(i%2==1) {
				strResult += Integer.toString(i) + " - ";
				intSum -=i;
			}
			else if(i==100){
				strResult += Integer.toString(i) + " = ";
				intSum +=i;
			}
			else {
				strResult += Integer.toString(i) + " + ";
				intSum +=i;
			}
		}
		System.out.println(strResult + intSum);
		
		//----------------------------------------------
		
		//배열
		//데이터타입 & 길이
		int[] arr = new int[10];
		arr[0] = 1;
		arr[1] = 11;
		arr[2] = 11;
		arr[3] = 1111;
		arr[4] = 11111;
		arr[5] = 121;
		arr[6] = 1121;
		arr[7] = 1221;
		arr[8] = 1212;
		arr[9] = 1211;
		
		
		
		
		//다차원 배열
		//0 - 0,4,5,6,11
		//1 - 1,8,3,1,1
		//2 - 5,12,11,10,9
		int[][] arrs = new int[3][5];//배열 안에 5칸짜리배열이 3개 들어감
		arrs[0][0] = 0; arrs[0][1] = 4; arrs[0][2] = 5; arrs[0][3] = 6; arrs[0][4] = 11;
		arrs[1][0] = 1; arrs[1][1] = 8; arrs[1][2] = 3; arrs[1][3] = 1; arrs[1][4] = 1;
		arrs[2][0] = 5; arrs[2][1] = 12; arrs[2][2] = 11; arrs[2][3] = 10; arrs[2][4] = 9;
		int result = 0;
		//배열의 모든수 합
		for(int i=0;i<arrs.length;i++) {
			//0, 1, 2
			for(int j=0;j<arrs[i].length;j++) {
				//0, 1, 2, 3, 4
				result += arrs[i][j];
			}                                                                                                                                                                                                                                                                                                                               
			
		}
		System.out.println(result);
	}

}
