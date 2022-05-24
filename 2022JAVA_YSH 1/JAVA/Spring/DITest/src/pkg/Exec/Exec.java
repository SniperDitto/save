package pkg.Exec;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pkg.Service.StockService;

public class Exec {

	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("setting.xml");
		StockService stockService = (StockService) context.getBean("stockService");
		stockService.printStockList("");
		
	}

}
