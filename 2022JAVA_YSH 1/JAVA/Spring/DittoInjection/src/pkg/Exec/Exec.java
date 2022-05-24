package pkg.Exec;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pkg.ditto.Service.DittoService;

public class Exec {

	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("setting.xml");
		DittoService dittoService = (DittoService) context.getBean("dittoServiceImpl");
		dittoService.printDittoInfo("");
		
	}

}
