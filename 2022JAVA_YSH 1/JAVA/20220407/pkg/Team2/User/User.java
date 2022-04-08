package pkg.Team2.User;

import pkg.Team1.Car.Car;

public abstract class User {
	
	private String userName;
	private int userAge;
	private double userExp;
	private Car myCar;

	public User() {
		this.userExp = 0;
	}
	public User(String userName, int userAge) {
		this.userName = userName;
		this.userAge = userAge;
		this.userExp = 0;
	}
	
	
	
	
	public abstract void greeting();
	

}
