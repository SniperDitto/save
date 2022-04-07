package pkg.Team1.Car;

public class SpecialEngine extends Engine{

	public SpecialEngine() {
		super();
	}
	public SpecialEngine(String engineName, double engineCap) {
		super(engineName, engineCap);
	}
	
	@Override
	public void explosion() {
		System.out.println("SpecialEngine 폭발");
	}
	
}
