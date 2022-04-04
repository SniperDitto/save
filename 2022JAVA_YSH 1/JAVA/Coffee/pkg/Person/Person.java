package pkg.Person;

public class Person {
	
	//1. 속성
	public String gender;
	public String name;
	
	
	//생성자
	public Person() {}
	public Person(String gender, String name) {
		this.gender = gender;
		this.name = name;
	}
	
	
	//2. 행위
	public void drinkCoffee() {
		System.out.println(this.name + "이(가) 커피를 마신다");
	}
	
	

	
	
	
	
	
	
}
