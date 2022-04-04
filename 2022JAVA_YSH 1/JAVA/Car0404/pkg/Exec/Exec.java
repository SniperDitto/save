package pkg.Exec;

import pkg.Car.Car;
import pkg.Car.SUV;
import pkg.Car.Sedan;
import pkg.Car.SportCar;
import pkg.Char.Animal;
import pkg.Char.People;

public class Exec {
	public static void main(String[] args) {
		
		Sedan sedan1 = new Sedan("현대", 180);
		sedan1.Run();
		sedan1.RunSedan();
		SUV suv1 = new SUV("지프", 200);
		suv1.Run();
		suv1.RunSUV();
		SportCar sportCar1 = new SportCar("람보르기니",250);
		sportCar1.Run();
		sportCar1.RunSportCar();
		
		People people1 = new People("인간","최유나","여자",24);
		people1.Introduce();
		People people2 = new People("인간","이아라","여자",28);
		people2.Introduce();
		Animal animal1 = new Animal("닭","Bob",people1);
		animal1.Introduce();
		Animal animal2 = new Animal("자라","프랭클린",people2);
		animal2.Introduce();
		
		
		//------------------------------------------
		
		People people = new People("사람", "홍길동", "감정");
		
		Sedan sedan = new Sedan("기아", 200, 100);
		SportCar sport = new SportCar("포르쉐", 300, "뚜-껑");
		
		//upcasting 형변환(묵시적)
		//부모클래스에 속하는 부분만 메모리(heap)에 올라감
		Car car1 = new Sedan("기아",200,100);
		Car car2 = new SUV("기아",200,6);
		Car car3 = new SportCar("기아",200,"뚜껑");
		
		
		
		
		
		
		
		
		
	}
}
