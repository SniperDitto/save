package pkg.Char;

public class People extends Character{
	
	public String gender;
	public int age;
	public String emotion;

	public People() {
		super();
	}
	public People(String kind, String name) {
		super(kind, name);
	}
	public People(String kind, String name, String gender, int age) {
		super(kind, name);
		this.gender = gender;
		this.age = age;
	}
	public People(String kind, String name, String emotion) {
		super(kind, name);
		this.emotion = emotion;
	}
	
	public void Introduce() {
		System.out.println("제 이름은 "+this.name+"이고 나이는 "+this.age+" 입니다.");
	}
	
	public void ExpressEmotion() {
		System.err.println(this.emotion);
	}
	
}
