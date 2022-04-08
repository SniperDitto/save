package pkg.Team1.Car;

import pkg.Commons.IFly;
import pkg.Commons.IShotGun;

public class AirCar extends Car implements IShotGun, IFly{
	
	private int bulletCnt;
	
	public AirCar() {
		super();
		this.bulletCnt = 30;
		this.setEngine(new AirEngine());
	}
	public AirCar(String carName) {
		super(carName);
		this.bulletCnt = 30;
		this.setEngine(new AirEngine());
	}

	
	@Override
	public void carRun() {
		this.getEngine().explosion();
		System.out.println("비행차가 달린다.");
	}

	@Override
	public void shotGun() {
		if(this.bulletCnt>0) {
			System.out.println("비행차가 포를 쏩니다.");
			this.bulletCnt--;
			System.out.println(Integer.toString(this.bulletCnt)+"발 남았습니다.");
		}
		else {
			System.out.println("남은 포탄이 없습니다.");
		}
	}

	@Override
	public void setBullet(int bulletCnt) {
		this.bulletCnt += bulletCnt;
		System.out.println(Integer.toString(bulletCnt)+"발 추가되었습니다.");
	}

	@Override
	public void fly() {
		System.out.println("비행차가 날아갑니다.");
	}

}
