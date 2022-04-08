package pkg.Team3.Exec;

import pkg.Commons.IFly;
import pkg.Team1.Car.AirCar;
import pkg.Team1.Car.Carpet;
import pkg.Team2.User.Warrior;

public class Exec {

	public static void main(String[] args) {
		
		Warrior w1 = new Warrior("전사 최밥창문", 24);
		AirCar airCar = new AirCar("비행자동차");
		
		w1.rideCar(airCar);
		
		//인터페이스로 받아올 수도 있다.
		//날아다니는 행위를 상속받은 클래스를 타입으로 생각?
		IFly carpet = new Carpet("마법의양탄자");
		w1.rideFly(carpet);
		
		
		
		
	}

}
