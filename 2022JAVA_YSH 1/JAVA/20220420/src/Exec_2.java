import java.io.File;


public class Exec_2 {

	public static void main(String[] args) {
		
		FilesTest f = new FilesTest();
		
		f.printFile("c:\\FileTest\\1234.txt");
		
		//---------------------------------------
		
		File file = new File("c:\\FileTest\\asdf");
		boolean isResult = file.mkdir();
		
		File[] existFiles = file.listFiles();
		
		
		
		
	}

}
