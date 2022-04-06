package pkg.Team.Car;

public class AirCar extends Car implements Fly{

	public AirCar() {
		super();
		this.carEngine = new NewEngine("비행엔진", 5000, "한화");
	}

	public AirCar(String carName) {
		super(carName);
		this.carEngine = new NewEngine("비행엔진", 5000, "한화");
	}

	@Override
	public void carRun() {
		this.carEngine.explode();
		System.out.println("비행차 "+this.getCarName()+"이(가) 달린다");
	}
	
	@Override
	public void fly() {
		System.out.println("비행차 "+this.getCarName()+"이(가) 날아간다");
	}

}
