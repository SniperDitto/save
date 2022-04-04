package pkg.Person;

import pkg.Coffee.CanCoffee;
import pkg.Coffee.Coffee;
import pkg.Coffee.MixCoffee;

public class Person {
	
	//1. 속성
	public String gender;
	public String name;
	public Coffee coffee;
	
	//생성자
	public Person() {}
	public Person(String gender, String name) {
		this.gender = gender;
		this.name = name;
	}
	
	public void setCoffee(Coffee coffee){
		this.coffee = coffee;
	}
	
	
	//2. 행위
	public void drinkCoffee() {
		System.out.println(this.name + "이(가) "
				+ this.coffee.beansKind + " 종류의 "
				+ this.coffee.beansCountry
				+"에서 만든 커피를 마신다");
		if(this.coffee instanceof MixCoffee) {
			//this.coffee가 MixCoffee 클래스인 경우
			((MixCoffee) this.coffee).MakeMixCoffee();
			//강제 형변환(downcasting)
		}
		else if(this.coffee instanceof CanCoffee) {
			//this.coffee가 CanCoffee 클래스인 경우
			((CanCoffee) this.coffee).DrinkCanCoffee();
			//강제 형변환(downcasting)
		}
	}
	
	

	
	
	
	
	
	
}
