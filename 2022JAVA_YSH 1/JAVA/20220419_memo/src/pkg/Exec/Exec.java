package pkg.Exec;

import java.io.File;

import pkg.FileTest.FileTest;

public class Exec {

	public static void main(String[] args) {
		
		FileTest f = new FileTest();
		//String dir = "c:\\FileTest\\test_2.txt";
		
		//f.writeFile(dir);
		
		//File testFile = new File(dir);
		
		//f.readFile(testFile);
		
		File orgFile = new File("C:\\FileTest\\aaa.xlsx");
		
		f.fileCopy(orgFile, "C:\\FileTest\\");
		
		
	}

}
