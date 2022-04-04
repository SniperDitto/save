package pkg.Person;

public class Teacher extends Person{
	
	public int career;
	
	
	public Teacher() {super();}
	public Teacher(String gender, String name) {
		super(gender, name);
	}
	public Teacher(String gender, String name, int career) {
		super(gender, name);
		this.career = career;
	}
	
	public void Teaching() {
		System.out.println(this.name + " : 폴드 사지마라 주머니빵꾸난다");
		System.out.println(this.name + " : 주식 사지마라 다팔아라");
	}
	
	
}
