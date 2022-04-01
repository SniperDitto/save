
public class Customer {
	
	
	//객체 - 속성 & 행위
	
	//속성 : property, attribute
	//행위 : method
	
	//Customer 클래스의 속성들
	public String cID;
	public String cName;
	public int cAge;
	public String cGender;//char 추천
	
	
	//Customer 클래스의 행위들
	public void buyProduct(String pName, int pPrice) {
		
		//~세 홍길동이 ~를 ~에 구매했다
		String strResult = Integer.toString(cAge)+"세 "
							+cName+" 고객이 "
							+pName+" 상품을 "
							+Integer.toString(pPrice)+"원에 구매했다."
							;
		System.out.println(strResult);
		//+DB에 구매한 상품 INSERT
		
	}
	
	//더하기
	public int getPlus(int start, int finish) {
		int forResult=0;
		int whileResult=0;
		int whileResult2=0;
		int whileResult3=0;
		
		//1. for
		for (int i=start;i<=finish;i+=3){
			forResult += i;
		}
		
		//2. while
		int num1 = start;
		while(num1 <= finish) {
			whileResult += num1;
			num1+=3;
		}
		while(true) {
			whileResult2 += num1;
			num1+=3;
			if (num1>finish) {
				break;
			}
		}
		
		//3. do while
		do {
			whileResult3+=num1;
			num1+=3;
		}while(num1<finish);
		

		
		
		
		
		
		return forResult;
		
		
		
		
	}
	
	
	
}
