package pkg.FilesTest;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Scanner;

public class Exec {

	public static void main(String[] args) {
		
		Scanner s = new Scanner(System.in);
		System.out.print("복사하고 싶은 파일의 경로+이름 입력 : ");
		String strP1 = s.nextLine();
		System.out.print("복사할 위치+파일 이름 입력 : ");
		String strP2 = s.nextLine();
		
		Path p1 = Paths.get(strP1);
		Path p2 = Paths.get(strP2);
		
		FilesTest test = new FilesTest();
		test.copyFile(p1, p2);
		
		//----------------------------
		File f = new File("c:\\FileTest\\");
		File[] files = f.listFiles();
		
		ArrayList<String> arrFiles = new ArrayList<String>();
		
		for(int i=0; i<files.length;i++) {
			if(!files[i].isDirectory()) {
				arrFiles.add(files[i].getName());
			}
		}
		Path dir1 = Paths.get("c:\\FileTest\\");
		Path dir2 = Paths.get("h:\\FileTest\\");
		try {
			Files.copy(dir1, dir2);
			
			Path fullPath1 = null;
			Path fullPath2 = null;
			for(String str : arrFiles) {
				fullPath1 = Paths.get("c:\\FileTest\\"+str);
				fullPath2 = Paths.get("h:\\FileTest\\"+str);
				Files.copy(fullPath1, fullPath2);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
