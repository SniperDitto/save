package pkg.Exec;

import pkg.Coffee.Coffee;
import pkg.Person.Student2;
import pkg.Person.Teacher;

public class Exec {

	public static void main(String[] args) {
		
		Coffee cof = new Coffee("수프리모","콜롬비아");
		cof.checkCoffee();
		
		Student2 stud2 = new Student2("여자", "최유나");
		stud2.drinkCoffee();
		stud2.Study();
		
		Teacher teacher = new Teacher("남자", "이지완", 20);
		teacher.Teaching();
		
		

	}

}
