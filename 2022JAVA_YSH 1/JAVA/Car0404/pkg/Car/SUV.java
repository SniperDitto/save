package pkg.Car;

public class SUV extends Car{
	
	public int seatNum;

	public SUV() {
		super();
	}
	public SUV(String brand, int maxSpeed) {
		super(brand, maxSpeed);
	}
	public SUV(String brand, int maxSpeed, int seatNum) {
		super(brand, maxSpeed);
		this.seatNum = seatNum;
	}
	
	public void RunSUV() {
		System.out.println("SUV가 달린다");
	}
	
}
