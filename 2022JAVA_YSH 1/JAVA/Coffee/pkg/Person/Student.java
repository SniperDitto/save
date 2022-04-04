package pkg.Person;

public class Student {
	
	//1. 속성
	public String gender;
	public String name;
	public String sID;
	
	//생성자
	public Student() {}
	public Student(String gender, String name) {
		this.gender = gender;
		this.name = name;
	}
	
	
	//2. 행위
	public void drinkCoffee() {
		System.out.println(this.name + "이(가) 커피를 마신다");
	}

	
	
}
