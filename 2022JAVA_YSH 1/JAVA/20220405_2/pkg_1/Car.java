package pkg_1;

public class Car {
	
	private String carName;
	public Car2 car2;
	public Engine engine;
	
	public Car() {}
	public Car(String carName) {
		this.carName = carName;
		this.car2 = new Car2();
		
		car2.methodA();
		
	}
	public void printName() {
		System.out.println(this.carName);
	}
	protected void setEngine(Engine e) {
		this.engine = e;
	}
	
	
}
