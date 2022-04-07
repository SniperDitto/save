package pkg.Team1.Car;

import pkg.Commons.IFly;

public class Carpet implements IFly{
	
	private String carpetName;
	private Engine engine;

	public Carpet() {
		this.engine = new AirEngine();
	}
	public Carpet(String carpetName) {
		this.carpetName = carpetName;
		this.engine = new AirEngine();
	}

	@Override
	public void fly() {
		System.out.println("날으는양탄자~");
	}

}
