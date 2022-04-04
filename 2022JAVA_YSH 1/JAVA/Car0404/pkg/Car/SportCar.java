package pkg.Car;

public class SportCar extends Car{
	
	public String converter;

	public SportCar() {
		super();
	}
	public SportCar(String brand, int maxSpeed) {
		super(brand, maxSpeed);
	}
	public SportCar(String brand, int maxSpeed, String converter) {
		super(brand, maxSpeed);
		this.converter = converter;
	}

	public void RunSportCar() {
		System.out.println("스포츠카가 달린다");
	}
	
	public void openConv() {
		System.out.println("스포츠카의 뚜껑을 연다");
	}
	
}
