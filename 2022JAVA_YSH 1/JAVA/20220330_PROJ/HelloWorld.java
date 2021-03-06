
public class HelloWorld {

	public static void main(String[] args) {
		//이게 주석 입니다
		System.out.println("Hello~");
		
		//변수
		//모든 변수는 데이터 타입을 지정해야 한다
		
		//1. 숫자 타입
		int a = 8;
		int b = 4;
		int c = a / b;//주의(컴파일 에러는 나지 않지만 정수가 아닐 수 있음)
		//int는 4byte = 32bit (1byte = 8bit)
		//1 bit : 0과 1 두가지 경우의 수
		//8 bit : 2*2*2*2*2*2*2*2가지 경우의 수
		//따라서 -2^31부터 +2^31-1까지의 정수 표현 가능(2^32=2,147,483,648)
		//	–2,147,483,648 ~ 2,147,483,647
		//	더 큰 수는 long(8byte)이용
		//나누기 할때 나누어떨어지지 않는 경우 주의
		
		//1) byte(-128~127 / 1byte)
		byte b1 = 127;
		
		//2) short(-32,767~32,766 / 2byte)
		short s1 = 12345;
		
		//3) int(–2,147,483,648 ~ 2,147,483,647 / 4byte) - 기본
		int a1 = 8;
		int b2 = 4;
		int c1 = a1 / b2;
		
		//4) long(-2^63 ~ +2^63-1 / 8byte)
		long l = 123123123123123L;
		//------------------------------------------
		//2. 실수 타입
		//1) float(4byte)
		float numF1 = 3.14f;
		float numF2 = 12.1235f;
		float numF3 = numF1 * numF2;
		System.out.println(numF3);
		
		//2) double(8byte) - 기본
		double num1 = 3.14;
		double num2 = 12.1235;
		double num3 = num1 * num2;
		System.out.println(num3);
		
		//float와 double은 소수점 정밀도가 다르다
		float numF4 = 1.1234567890f;
		double num4 = 1.12345678901234567890;
		System.out.println(numF4);//7자리
		System.out.println(num4);//15자리
		
		//------------------------------------------
		//3. 문자 타입
		//1) String 문자열
		String str = "안녕하세요";
		System.out.println(str);
		//문자열 연결
		String strName = "홍길동";
		String strGreet = "안녕";
		
		String strResult = strName + " " + strGreet;
		System.out.println(strResult);
		
		//2) Char 문자
		char ch1 = 'A';
		System.out.println(ch1);
		
		//------------------------------------------
		//4. boolean 타입
		boolean isGood = true;
		boolean isEat = false;
		
		
		
		
		
		
		
		
	}

}
