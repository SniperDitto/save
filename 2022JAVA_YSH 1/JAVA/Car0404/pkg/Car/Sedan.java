package pkg.Car;

public class Sedan extends Car{

	public int height;
	
	public Sedan() {
		super();
	}
	public Sedan(String brand, int maxSpeed) {
		super(brand, maxSpeed);
	}
	public Sedan(String brand, int maxSpeed, int height) {
		super(brand, maxSpeed);
		this.height = height;
	}
	
	public void RunSedan() {
		System.out.println("세단이 달린다");
	}
	
}
