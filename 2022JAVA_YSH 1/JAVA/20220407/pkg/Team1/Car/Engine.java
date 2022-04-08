package pkg.Team1.Car;

public abstract class Engine {

	private String engineName;
	private double engineCap;
	
	public Engine() {}
	public Engine(String engineName, double engineCap) {
		this.engineName = engineName;
		this.engineCap = engineCap;
	}
	
	public abstract void explosion();
	
	

}
