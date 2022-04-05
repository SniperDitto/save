package pkg.User;

import pkg.Car.Car;

public class User {
	
	public String userName;
	public Car[] cars;
	private int carCount;
	public Car selCar;
	
	public User() {
		this.cars = new Car[10];
		this.carCount=0;
	}
	public User(String userName) {
		this.userName = userName;
		this.cars = new Car[10];
		this.carCount=0;
	}
	
	public void buyCar(Car car) {
		cars[carCount] = car;
		this.carCount++;
	}
	
	public void showCarList() {
		System.out.println(this.userName+"의 차 목록");
		for(int i=0;i<carCount;i++) {
			System.out.println((i+1)+"번째 차ㄱ");
			cars[i].showCarProp();
		}
	}
	
	public void selectCar(int carIndex) {
		//들어온 index값에 차가 있는지 먼저 확인
		if(selCar==null) {
			if(carIndex < carCount) {
				this.selCar = cars[carIndex];
				System.out.println(selCar.carName+"를 탔습니다.");
			}
			else {
				System.out.println("올바르지 않은 index입니다");
			}
		}
		else {
			System.out.println(this.selCar.carName+"에 이미 타고 있습니다.");
		}
		
	}
	
	public void getOutCar() {
		System.out.println(this.selCar.carName+"에서 내렸습니다");
		this.selCar = null;
		
	}
	
	
	
	
}
