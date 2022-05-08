import java.io.File;

public class Exec {

	public static void main(String[] args) {
		
		FileTest f = new FileTest();
		//f.testOutputStream();
		//f.testInputStream();
		//f.fileClassTest();
		
		File orgFile = new File("C:\\FileTest\\aaa.xlsx");
		//File copyFile = new File("C:\\FileTest\\bbb.xlsx");
		
		f.fileCopy(orgFile);
		
	}

}
