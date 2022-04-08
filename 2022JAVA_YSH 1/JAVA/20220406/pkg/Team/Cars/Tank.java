package pkg.Team.Cars;

public class Tank extends Car{
	//field
	private int maxAmmo;
	
	//constructor
	public Tank() {
		super();
	}
	public Tank(String carName, int maxSpeed) {
		super(carName, maxSpeed);
	}
	public Tank(String carName, int maxSpeed, int maxAmmo) {
		super(carName, maxSpeed);
		this.maxAmmo = maxAmmo;
	}
	
	//method
	@Override
	public void carRun() {
		System.out.println("탱크 "+this.getCarName()+"이(가) 달린다.");
	}
	@Override
	public void fixEngine() {
		BigEngine bEngine = new BigEngine();
		this.setCarEngine(bEngine);
	}
	public void speedUP() {
		this.setNowSpeed(this.getNowSpeed() + 2);
		System.out.println("현재 속도 2 증가");
	}
	
	//getter, setter
	public int getMaxAmmo() {
		return maxAmmo;
	}
	
	
	
}
