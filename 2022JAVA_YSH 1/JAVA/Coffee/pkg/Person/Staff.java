package pkg.Person;

public class Staff extends Person{
	
	public String staffID;
	
	public Staff() {super();}
	public Staff(String gender, String name) {
		super(gender, name);
	}
	public Staff(String gender, String name, String staffID) {
		super(gender, name);
		this.staffID = staffID;
	}
	
	public void Support() {
		System.out.println(this.name+" : 음료수들고가세요");
	}
	
}
