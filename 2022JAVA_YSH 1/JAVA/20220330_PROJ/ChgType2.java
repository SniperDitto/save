
public class ChgType2 {

	public static void main(String[] args) {
		
		//숫자 정수형
		//byte, short, char, int, long
		int a = 123;
		long b = 12345L;
		
		long c =  a; // 작 -> 큰
		int d =  (int) b; //큰 -> 작(명시)
		
		//숫자 실수형
		//float(4byte), double(8byte)
		float f = 1234.1234f;
		double dd = 1234.1234;
		
		double d3 = f;// 작 -> 큰
		float f2 = (float)dd;//큰 -> 작(명시)
		
		//String
		String str1 = "";
		
		//boolean
		boolean b1 = true;
		
		//char
		char ch = '1';
		int chInt = (int)ch;
		
		int iChar = 65;
		char cInt = (char)iChar;
		
		
		
	}

}
