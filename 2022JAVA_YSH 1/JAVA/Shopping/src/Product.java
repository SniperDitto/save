
public class Product {
	//상품의 속성
	public String pName;
	public int pPrice;
	public int limitAge;
	
	//나이에 따른 판매 조건
	public void checkAge(int cusAge) {
		if(cusAge>=limitAge) {
			System.out.println(pName+" 구매 가능");
		}
		else {
			System.out.println(pName+" 구매 불가");
		}
	}
	
}
