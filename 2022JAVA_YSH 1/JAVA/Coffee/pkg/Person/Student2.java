package pkg.Person;

//Person class 상속 : person + student2 내용 만들수있음
public class Student2 extends Person{
	public String sID;
	//생성자는 만들어야 함
	public Student2() {
		super();
	}
	public Student2(String gender, String name) {
		super(gender, name);//부모 클래스거 그대로 
	}
	public Student2(String gender, String name, String sID) {
		super(gender, name);//부모 클래스거 그대로 
		this.sID = sID;
	}
	
	public void Study() {
		System.out.println(this.name + "은(는) 공부를 한다");
	}
	
	
}
