package pkg.Team.Car;

public abstract class Car {
	
	private String carName;
	protected Engine carEngine;
	
	public Car() {}
	public Car(String carName) {
		this.carName = carName;
	}
	

	public String getCarName() {
		return carName;
	}
	public Engine getCarEngine() {
		return carEngine;
	}
	
	//자동차에 따라 다름
	public abstract void carRun();
	
	//모든 자동차가 똑같이 출력
	public void showCarInfo() {
		System.out.println("---------------------");
		System.out.println("이름 : "+this.carName);
		System.out.println("엔진이름 : "+this.carEngine.getEngineName());
		System.out.println("엔진용량 : "+this.carEngine.getEngineCapacity());
		System.out.println("엔진제조사 : "+this.carEngine.getEngineCompany());
		System.out.println("---------------------");
	}
	
	
	
	
	
	
	
}
