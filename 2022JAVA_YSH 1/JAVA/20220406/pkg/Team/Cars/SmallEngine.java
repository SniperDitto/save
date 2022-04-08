package pkg.Team.Cars;

public class SmallEngine extends Engine{
	
	public SmallEngine() {
		super();
	}
	public SmallEngine(double engCapacity) {
		super(engCapacity);
	}
	
	
	@Override
	public void engExplosion() {
		System.out.println("폭발");
	}
	
	
	
	
}
