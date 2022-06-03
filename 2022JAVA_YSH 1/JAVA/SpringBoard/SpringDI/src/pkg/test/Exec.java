package pkg.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Exec {
	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("setting.xml");
		Car car = (Car) context.getBean("car");
		car.getOwner().showGender();
	}
}
