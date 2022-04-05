package pkg.Exec;

import pkg.Car.SUV;
import pkg.Car.Sedan;
import pkg.Car.Tank;
import pkg.Tire.BigTire;
import pkg.Tire.SmallTire;
import pkg.Tire.SpecialTire;
import pkg.Tire.Tire;
import pkg.User.User;

public class Exec {

	public static void main(String[] args) {
		
		Sedan sedan = new Sedan("기아","과학 5호기");
		Sedan sedan2 = new Sedan("현대","쏘나타");
		SUV suv = new SUV("기아","쏘렌토");
		SUV suv2 = new SUV("르노","QM6");
		Tank tank = new Tank("탱크","tank1");
		sedan.carRun();
		
		SmallTire sTire = new SmallTire("세단 타이어","넥센",12);
		SmallTire sTire2 = new SmallTire("세단 타이어","넥센",12);
		BigTire bTire = new BigTire("SUV 타이어","한국",22);
		BigTire bTire2 = new BigTire("SUV 타이어","한국",22);
		SpecialTire specialTire = new SpecialTire("탱크 타이어","한화",50);
		
		sedan.setTire(sTire);//Tire로 자동 형변환됨
		sedan2.setTire(sTire2);
		suv.setTire(bTire);
		suv2.setTire(bTire2);
		tank.setTire(specialTire);
		
		//---------------------
		sTire.tirePunk();
		Tire tire1 = new SmallTire("세단 타이어2","넥센",13);//upcasting
		tire1.tirePunk();
		//자식 클래스의 메서드 사용 위해 downcasting
		((SmallTire) tire1).checkProperty();
		//---------------------
		
		User user1 = new User("홍길동");
		user1.buyCar(sedan);
		user1.buyCar(suv2);
		user1.buyCar(tank);
		//user1이 가진 자동차 리스트
		user1.showCarList();
		//user1이 suv2를 탄다
		user1.selectCar(1);user1.selectCar(2);
		user1.getOutCar();
		//user1이 탱크를 탄다
		user1.selectCar(2);
		user1.getOutCar();
		
		
	}

}
