package pkg.Team2.User;

import pkg.Commons.IFly;
import pkg.Team1.Car.Car;

public class Warrior extends User {
	
	//원래는 User에 있어야 함. 수업 편의상 여기다
	private Car myCar;
	private IFly myFly;
	private boolean isRideCar;//타고있는지
	private boolean isRideFly;
	
	public Warrior() {
		super();
		this.isRideCar = false;
		this.isRideFly = false;
	}

	public Warrior(String userName, int userAge) {
		super(userName, userAge);
		this.isRideCar = false;
		this.isRideFly = false;
	}
	
	
	public Car getMyCar() {
		return this.myCar;
	}
	

	@Override
	public void greeting() {
		System.out.println("저는 전사입니다.");
	}
	public void attack() {
		System.out.println("전사가 공격합니다.");
	}
	
	
	//차나 날아다니는것을 타고 있지 않은 상태여야 탑승
	public void rideCar(Car car) {
		if(isRideCar==false && isRideFly==false) {
			this.myCar = car;
			isRideCar = true;
		}
	}
	public void getOffCar(){
		if(isRideCar) {
			System.out.println("차에서 내렸습니다.");
			this.isRideCar = false;
		}
	}
	public void rideFly(IFly myFly) {
		//날아다니는 탈것
		//인터페이스를 타입으로
		if(isRideCar==false && isRideFly==false) {
			this.myFly = myFly;
			isRideFly = true;
		}
	}
	public void getOffFly(){
		if(isRideFly) {
			System.out.println("날아다니는 탈것에서 내렸습니다.");
			this.isRideFly = false;
		}
	}
	

}
