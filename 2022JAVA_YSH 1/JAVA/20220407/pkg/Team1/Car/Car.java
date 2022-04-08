package pkg.Team1.Car;

public abstract class Car {
	//-----
	private String carName;
	private Engine engine;
	
	//-----
	public Car() {}
	public Car(String carName) {
		this.carName = carName;
		
	}
	
	//-----
	public String getCarName() {
		return this.carName;
	}
	protected Engine getEngine() {
		return this.engine;
	}
	protected void setEngine(Engine engine) {
		this.engine = engine;
	}
	
	//-----
	public abstract void carRun();

}
