package pkg_3;

import pkg_1.Car;
import pkg_2.User;
//import pkg_1.Car2; -> default class는 같은 클래스에서만 접근 가능

public class Exec {

	public static void main(String[] args) {
		Car car = new Car("차");
		//Car2 car2 = new Car2();
		User user = new User();
		
		user.setCar(car);
		
	}

}
