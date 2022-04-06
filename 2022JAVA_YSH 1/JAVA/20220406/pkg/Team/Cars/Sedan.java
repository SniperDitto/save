package pkg.Team.Cars;

public class Sedan extends Car{
	
	public Sedan() {
		super();
	}
	public Sedan(String carName, int maxSpeed) {
		super(carName, maxSpeed);
	}
	
	@Override
	public void carRun() {
		System.out.println("세단 "+this.getCarName()+"이(가) 달린다");
		
	}
	@Override
	public void fixEngine() {
		SmallEngine sEngine = new SmallEngine();
		this.setCarEngine(sEngine);
	}
	
	
	
}
