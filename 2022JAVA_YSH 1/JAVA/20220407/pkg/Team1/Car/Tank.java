package pkg.Team1.Car;

import pkg.Commons.IShotGun;

public class Tank extends Car implements IShotGun{
	
	private int bulletCnt;

	public Tank() {
		super();
		this.bulletCnt = 10;
		this.setEngine(new SpecialEngine());
	}

	public Tank(String carName) {
		super(carName);
		this.bulletCnt = 10;
		this.setEngine(new SpecialEngine());
	}

	@Override
	public void carRun() {
		this.getEngine().explosion();
		System.out.println("탱크가 달린다");
	}

	@Override
	public void shotGun() {
		if(this.bulletCnt>0) {
			System.out.println("탱크가 대포를 쏩니다.");
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
	}
	
	

}
