package pkg.Team.Car;

abstract class Engine {
	private String engineName;
	private double engineCapacity;
	private String engineCompany;
	
	public Engine() {}
	public Engine(String engineName, double engineCapacity) {
		this.engineName = engineName;
		this.engineCapacity = engineCapacity;
	}
	public Engine(String engineName, double engineCapacity, String engineCompany) {
		this.engineName = engineName;
		this.engineCapacity = engineCapacity;
		this.engineCompany = engineCompany;
	}
	
	
	public String getEngineName() {
		return engineName;
	}
	public double getEngineCapacity() {
		return engineCapacity;
	}
	public String getEngineCompany() {
		return engineCompany;
	}
	
	
	public abstract void explode();
	
}
