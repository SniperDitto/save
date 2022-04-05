package pkg.Car;

import pkg.Tire.BigTire;
import pkg.Tire.Tire;

public class SUV extends Car {

	public SUV() {
		super();
	}
	public SUV(String carBrand, String carName) {
		super(carBrand, carName);
	}
	
	@Override
	public void setTire(Tire tire) {
		//SUV는 bigtire만 장착가능
		if(tire instanceof BigTire) {
			this.tire = tire;
			System.out.println(this.tire.tireName+"(으)로 타이어 교체");
		}
		else {
			System.out.println("SUV는 큰 타이어만 장착 가능합니다");
		}
	}

}
