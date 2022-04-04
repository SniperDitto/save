package pkg.Char;

public class Animal extends Character{

	public People owner;
	
	public Animal() {
		super();
	}
	public Animal(String kind, String name) {
		super(kind, name);
	}
	public Animal(String kind, String name, People owner) {
		super(kind, name);
		this.owner = owner;
	}
	
	public void Introduce() {
		System.out.println("저는 "+this.kind+" "+this.name+"이고 제 주인은 "+this.owner.name+" 입니다.");
	}
	
}
