package pkg.Team.Car;

public class Tank extends Car implements Fly{

	public Tank() {
		super();
		this.carEngine = new BigEngine("엔진", 1000, "기아");
	}

	public Tank(String carName) {
		super(carName);
		this.carEngine = new BigEngine("엔진", 1000, "기아");
	}

	@Override
	public void carRun() {
		this.carEngine.explode();
		System.out.println("탱크 "+this.getCarName()+"이(가) 달린다");
	}
	
	public void fireGun() {
		System.out.println("포탄 발사");
	}

	@Override
	public void fly() {
		System.out.println("탱크 "+this.getCarName()+"이(가) 날아간다");
	}

}
