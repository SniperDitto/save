package pkg.Team.Exec;

import pkg.Team.Car.Car;
import pkg.Team.User.User;

public class Exec {

	public static void main(String[] args) {
		
		/*
		Car car1 = new Car("Sonata");
		Car car2 = new Car("SantaFe");
		User user1 = new User("홍길동");
		
		user1.rideCar(car1);
		
		Car user1_Car = user1.getUserCar();
		user1_Car.carRun();*/
		
		//엔진을 만들어서 넣어주지 말고 미리 만들어서 장착되어 있어야 한다(캡슐화)
		/*
		SmallEngine sEngine = new SmallEngine("엔진", 1000);
		Car car = new Car("쏘나타",sEngine);
		User user = new User("홍길동2");
		*/
		//1. 일단 엔진 클래스를 볼 수 없어야 한다
		//엔진 클래스를 public -> default로 바꿔서 같은 패키지 내에서만 볼 수 있도록 한다
		//2. Car의 속성 중 엔진을 private로
		//3. Car의 생성자에 엔진을 추가할 수 있도록 만든다
		/*
		Car car = new Car("쏘나타");
		User user = new User("홍");
		user.setUserCar(car);
		user.getUserCar().carRun();
		*/
		
		
		
		
	}

}
