package pkg.Test;

public class Exec {

	public static void main(String[] args) {
		
		FilesTest2 f2 = new FilesTest2("c:\\Temp\\", "temporary.txt");
		System.out.println("=================");
		String strWrite = "유나바보";
		System.out.println(f2.readList().toString());
		f2.write("바보");
		System.out.println(f2.readList().toString());
	}

}
