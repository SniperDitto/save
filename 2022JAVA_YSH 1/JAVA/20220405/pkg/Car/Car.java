package pkg.Car;

import pkg.Tire.Tire;

public class Car {
	
	public String carBrand;
	public String carName;
	public int nowSpeed;
	public Tire tire;
	
	public Car() {}
	public Car(String carBrand, String carName) {
		this.carBrand = carBrand;
		this.carName = carName;
		this.nowSpeed = 0;
	}
	
	public void carRun() {
		this.nowSpeed += 10;
		System.out.println(this.carName+"가 "
					+Integer.toString(this.nowSpeed)+"km/s로 달린다.");
	}
	
	public void setTire(Tire tire) {
		this.tire = tire;
		System.out.println(this.tire.tireName+"(으)로 타이어 교체");
	}
	
	public void showCarProp() {
		System.out.println("---------------");
		System.out.println("차 브랜드 : "+this.carBrand);
		System.out.println("차 이름 : "+this.carName);
		System.out.println("차의 타이어 : "+this.tire.tireName);
		System.out.println("---------------");
	}
	
	
}
