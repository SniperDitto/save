package pkg.Team.Car;

public class SmallEngine extends Engine{
	
	private String engineName;
	private double engineCapacity;
	
	public SmallEngine() {
		super();
	}
	public SmallEngine(String engineName, double engineCapacity) {
		super(engineName, engineCapacity);
	}
	public SmallEngine(String engineName, double engineCapacity, String engineCompany) {
		super(engineName, engineCapacity, engineCompany);
	}
	
	public String getEngineName() {
		return engineName;
	}
	public double getEngineCapacity() {
		return engineCapacity;
	}
	public void setEngineCapacity(double engineCapacity) {
		this.engineCapacity = engineCapacity;
	}
	
	@Override
	public void explode() {
		System.out.println("작은 엔진 폭발");
	}
	
	
}
