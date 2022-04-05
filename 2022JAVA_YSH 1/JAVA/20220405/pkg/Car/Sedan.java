package pkg.Car;

import pkg.Tire.SmallTire;
import pkg.Tire.Tire;

public class Sedan extends Car{
	
	public int tireCnt;

	public Sedan() {
		super();
	}
	public Sedan(String carBrand, String carName) {
		super(carBrand, carName);
	}
	public Sedan(String carBrand, String carName, int tireCnt) {
		super(carBrand, carName);
		this.tireCnt = tireCnt;
	}
	
	//부모클래스 car의 메서드를 재정의 
	//오버라이딩(overriding)
	@Override //annotation으로 표시한다
	public void carRun() {
		this.nowSpeed += 5;
		System.out.println("세단 "+this.carName+" : "+this.nowSpeed+"km/s로 달린다");
		
	}
	
	@Override
	public void setTire(Tire tire) {
		//smalltire만 끼울 수 있게 하기 위해 재정의
		if(tire instanceof SmallTire) {
			this.tire = tire;
			System.out.println(this.tire.tireName+"(으)로 타이어 교체");
			((SmallTire) tire).checkProperty();//다시 자식클래스로 downcasting
		}
		else {
			System.out.println("세단은 작은 타이어만 장착 가능합니다");
		}
		
	}
	
}
