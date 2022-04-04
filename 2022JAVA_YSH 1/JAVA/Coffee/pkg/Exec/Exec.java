package pkg.Exec;

import pkg.Coffee.CanCoffee;
import pkg.Coffee.MixCoffee;
import pkg.Person.Person;
import pkg.Person.Student2;

public class Exec {

	public static void main(String[] args) {
		
		//upcasting, downcasting : 형변환
		
		Student2 stud2 = new Student2("여자", "유나","S001");
		stud2.Study();
		
		//자식 클래스를 부모 클래스의 데이터타입으로 선언(upcasting)
		Person p1 = new Student2("여자", "유나");
		//p1.Study(); -> 실행 불가, 부모 클래스의 메서드만 사용 가능
		
		
		CanCoffee c1 = new CanCoffee("원두1","칠레","오뚜기");
		CanCoffee c2 = new CanCoffee("원두2","미국","농심");
		MixCoffee m1 = new MixCoffee("원두3","한국",1000);
		//person class의 coffee는 coffee(부모)타입이지만
		//상속받은 다른 종류의 커피들도 들어간다(자동으로 upcasting)
		p1.coffee = c2;
		p1.drinkCoffee();
		
		//person class에서 상속받은 다른 종류의 커피들 안의 메서드를 사용하기 위해
		//downcasting을 한다
		((MixCoffee) p1.coffee).MakeMixCoffee();
		
		
		

	}

}
