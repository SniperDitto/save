package pkg.Coffee;

public class Coffee {
	
	//커피에 대한 추상적인 것들을 표현
	//1. 속성
	//다른 음료와 차별되는 커피만의 속성
	public String beansKind;
	public String beansCountry;
	
	
	//생성자 : 클래스가 인스턴스화 될 때 실행됨
	public Coffee(){}
	//오버로딩 : 이름이 같은 메서드를 다른 매개변수로 만드는 것
	public Coffee(String beansKind, String beansCountry){
		this.beansKind = beansKind;
		this.beansCountry = beansCountry;
	}	
	
	
	//2.행위 - 메서드
	public void checkCoffee() {
		System.out.println("beansKind : " + this.beansKind);
		System.out.println("beansCountry : " + this.beansCountry);
	}
	
	
	

	
	
	
}
