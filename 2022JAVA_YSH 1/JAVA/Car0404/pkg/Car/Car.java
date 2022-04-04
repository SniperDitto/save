package pkg.Car;

public class Car {
	
	public String brand;
	public int maxSpeed;
	
	public Car() {}
	public Car(String brand, int maxSpeed) {
		this.brand = brand;
		this.maxSpeed = maxSpeed;
	}
	
	public void Run() {
		System.out.println("부릉부릉");
	}
	
}
