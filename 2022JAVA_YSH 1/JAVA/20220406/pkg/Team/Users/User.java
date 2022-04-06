package pkg.Team.Users;

import pkg.Team.Cars.Car;

public class User {
	
	private Car myCar;
	
	public User() {}
	public User(Car myCar) {
		this.myCar = myCar;
	}
	
	public Car getMyCar() {
		return myCar;
	}
	public void setMyCar(Car myCar) {
		this.myCar = myCar;
	}
	
	
	
}
