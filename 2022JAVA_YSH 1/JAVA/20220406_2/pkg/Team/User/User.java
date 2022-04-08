package pkg.Team.User;

import pkg.Team.Car.Car;

public class User {
	
	private String userName;
	private Car userCar;
	
	public User() {}
	public User(String userName) {
		this.userName = userName;
	}

	
	public String getUserName() {
		return userName;
	}
	public Car getUserCar() {
		return userCar;
	}
	public void setUserCar(Car userCar) {
		this.userCar = userCar;
	}
	
	
	public void rideCar(Car userCar) {
		this.setUserCar(userCar);
		System.out.println(this.getUserName()+"이(가) "+this.getUserCar().getCarName()+"을(를) 탄다");
	}
	
}
