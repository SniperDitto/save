package pkg.Team.Cars;

public class BigEngine extends Engine{
	
	public BigEngine() {
		super();
	}
	public BigEngine(double engCapacity) {
		super(engCapacity);
	}
	
	
	@Override
	public void engExplosion() {
		System.out.println("폭발");
	}
	
	
	
}
