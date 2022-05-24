package pkg.board.Exec;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pkg.board.Service.BoardService;

public class Exec {

	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("setting.xml");
		BoardService boardService = (BoardService) context.getBean("boardService");
		
		boardService.printYoonaBabo();
		
	}

}
