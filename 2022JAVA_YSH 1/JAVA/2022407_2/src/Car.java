
public class Car implements IFly{
	
	private String carName;
	private Engine engine;
	
	public Car(String carName) {
		this.carName = carName;
		this.engine = new Engine("엔진1");
	}
	
	public String getCarName() {
		return this.carName;
	}

	public void carRun() {
		this.engine.explosion();
		System.out.println("차가 달린다.");
	}

	@Override
	public void fly() {
		System.out.println("차가 난다.");
	}
	
	
	
}
