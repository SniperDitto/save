

public class Car {
	
	private String carName;
	private CarKind carKind;
	
	public Car() {}
	public Car(String carName, CarKind carKind) {
		this.carName = carName;
		this.carKind = carKind;
	}
	
	public String getCarName() {
		return carName;
	}
	public CarKind getCarKind() {
		return carKind;
	}
	public void setCarKind(CarKind carKind) {
		this.carKind = carKind;
	}
	
	public int getPrice() {
		int price;
		
		if(this.carKind == carKind.Sonata) {
			price = 2500;
		}
		else if(this.carKind == carKind.Avante) {
			price = 2000;
		}
		else if(this.carKind == carKind.SantaFe) {
			price = 3000;
		}
		else {
			price = 0;
		}
		return price;
	}
	
	
	
}
