
public class ChgType {

	public static void main(String[] args) {
		
		//형 변환 / Casting
		
		//1. 묵시적 형변환
		//메모리가 작은 데이터(4byte) -> 큰 데이터(8byte) / up casting
		int num1 = 123;
		long num2 = num1;//int->long
		
		float f = 123.456f;
		double d = f;//float->double
		
		//2. 명시적 형변환 - 메모리 공간 주의
		//변환할 데이터를 적어야 한다
		//메모리가 큰 데이터(8byte) -> 작은 데이터(4byte) / down casting
		long num3 = 1234;
		int num4 = (int)num3;//long->int
		
		//주의 : 4byte를 초과하는 값을 4byte로 변환하면?
		long num5 = 5000000000L;
		int num6 = (int)num5;
		System.out.println(num5);
		System.out.println(num6);
		
		//3. 문자-숫자
		int a = 123456;
		int b = 21354;
		int c = a + b;
		String aString = "123456";
		String bString = "21354";
		String cString = aString + bString;
		
		System.out.println(c);
		System.out.println(cString);
		
		//int + String ???
		String strName = "홍길동";
		int age = 34;
		String strResult = strName + "은 " + age + "살 입니다.";//가능은 하지만 쓰지 말자
		String strResult2 = strName + "은 " + Integer.toString(age) + "살 입니다.";
		System.out.println(strResult);
		System.out.println(strResult2);
		
		//String -> integer
		int numA = Integer.parseInt(aString);
		int numB = Integer.parseInt(bString);
		int numC = numA + numB;
		System.out.println(numC);
		
		//integer -> String
		String strA = Integer.toString(a);
		String strB = Integer.toString(b);
		String strC = strA + strB;
		System.out.println(strC);
		
		//char -> integer
		//char의 아스키 코드 값이 됨 -> 유니코드
		char chA = 'A';
		int intCharA = 'A';
		System.out.println(chA);
		System.out.println((int)chA);
		System.out.println(intCharA);
		
	}

}
