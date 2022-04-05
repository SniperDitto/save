package pkg.Car;

import pkg.Tire.SmallTire;
import pkg.Tire.SpecialTire;
import pkg.Tire.Tire;

public class Tank extends Car{

	public Tank() {
		super();
	}
	public Tank(String carBrand, String carName) {
		super(carBrand, carName);
	}
	
	@Override
	public void carRun() {
		this.nowSpeed += 2;
		System.out.println(this.carName+" : 탱크 갑니다");
	}
	
	@Override
	public void setTire(Tire tire) {
		//specialTire만 장착
		if(tire instanceof SpecialTire) {
			this.tire = tire;
			System.out.println(this.tire.tireName+"(으)로 타이어 교체");
		}
		else {
			System.out.println("탱크는 특수 타이어만 장착 가능합니다");
		}
		
	}
	
	public void fireGun() {
		System.out.println("발사");
	}

}
