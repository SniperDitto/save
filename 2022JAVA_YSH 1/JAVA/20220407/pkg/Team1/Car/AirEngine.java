package pkg.Team1.Car;

public class AirEngine extends Engine {

	public AirEngine() {
		super();
	}

	public AirEngine(String engineName, double engineCap) {
		super(engineName, engineCap);
	}

	@Override
	public void explosion() {
		System.out.println("AirEngine 폭발");
	}

}
