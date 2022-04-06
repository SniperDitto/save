package pkg.Team.Cars;

public abstract class Engine {
	
	private double engCapacity;
	
	public Engine() {}
	public Engine(double engCapacity) {
		this.engCapacity = engCapacity;
	}
	
	public abstract void engExplosion();
	
	
	
}
