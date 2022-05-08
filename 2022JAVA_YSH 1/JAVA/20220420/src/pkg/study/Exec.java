package pkg.study;

public class Exec {

	public static void main(String[] args) {
		
		FileStudy1 f = new FileStudy1();
		
		String oldDir = "c:\\FileTest\\";
		String newDir = "c:\\FileTest\\copy\\";
		String fileName = "1234.txt";
		
		f.copy(oldDir, newDir, fileName);
		
		
		
		
	}

}
