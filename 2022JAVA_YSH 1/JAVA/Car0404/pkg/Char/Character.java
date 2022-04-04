package pkg.Char;

import pkg.Car.Car;

public class Character {
	
	public String kind;
	public String name;
	
	public Character() {}
	public Character(String kind, String name) {
		this.kind = kind;
		this.name = name;
	}
	
	public void RideCar(Car car) {
		System.out.println(this.name + "은 "+car.brand+"차를 탄다");
	}
	
}
