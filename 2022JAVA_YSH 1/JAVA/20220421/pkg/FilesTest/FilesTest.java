package pkg.FilesTest;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

public class FilesTest {

	public void copyFile(Path p1, Path p2) {
		try {
			if(Files.exists(p1)) {
				if(Files.exists(p2)) {
					//덮어써서 복사
					Files.copy(p1, p2, StandardCopyOption.REPLACE_EXISTING);
				}else {
					Files.copy(p1, p2);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public void copyFolder() {
		//폴더 복사하기
		//isDirectory
		
		
		
	}
	
	
}
