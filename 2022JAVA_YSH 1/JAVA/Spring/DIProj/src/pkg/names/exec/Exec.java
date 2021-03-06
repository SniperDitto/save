package pkg.names.exec;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pkg.names.DataHandle;
import pkg.names.DataService;
import pkg.names.IDataHandle;

public class Exec {

	public static void main(String[] args) {
		
		DataHandle data = new DataHandle("몽짱",3);
		
		//몽짱은 3살이다
		String name = data.getName();
		int age = data.getAge();
		System.out.printf("%s은 %d살이다.", name, age);
		
		DataService service = new DataService((IDataHandle) data);
		System.out.println(service.getResult());
		
		//----------------------------
		
		ApplicationContext context = new ClassPathXmlApplicationContext("setting.xml");
		DataService dataService = (DataService) context.getBean("dataService");
		System.out.println(dataService.getResult());
		
		
		
	}

}
