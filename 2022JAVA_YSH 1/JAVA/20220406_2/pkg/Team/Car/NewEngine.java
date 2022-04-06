package pkg.Team.Car;

public class NewEngine extends Engine{
	public NewEngine() {
		super();
	}
	public NewEngine(String engineName, double engineCapacity) {
		super(engineName, engineCapacity);
	}
	public NewEngine(String engineName, double engineCapacity, String engineCompany) {
		super(engineName, engineCapacity, engineCompany);
	}
	
	@Override
	public void explode() {
		System.out.println("새 엔진 폭발");
	}
	
	
}
