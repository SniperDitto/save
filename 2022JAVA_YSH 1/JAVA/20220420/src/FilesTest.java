import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FilesTest {
	
	public void printFile(String dir) {
		
		try {
			Path p = Paths.get(dir);
			
			boolean isExist = Files.exists(p, LinkOption.NOFOLLOW_LINKS);
			
			if(isExist) {
				for(String s : Files.readAllLines(p, StandardCharsets.UTF_8)) {
					System.out.print(s);
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void copyStream(String oldFullDir, String newDir) {
		//oldFullDir = c:\\..\\asdf.txt
		//폴더, 파일+확장자(aaa.txt), 파일이름만(aaa), 확장자만(.txt)
		String onlyDir = oldFullDir.substring(0,oldFullDir.lastIndexOf("\\"));
		String onlyFile = oldFullDir.substring(oldFullDir.lastIndexOf("\\"));
		String onlyFileName = onlyFile.substring(0,onlyFile.lastIndexOf("."));
		String onlyFileExt = onlyFile.substring(onlyFile.lastIndexOf("."));
		Path oldPath = Paths.get(oldFullDir);
		//파일명중복체크는?
		Path newPath = Paths.get(newDir+onlyFile);
		
		//Stream이용
		try {
			InputStream in = Files.newInputStream(oldPath);
			OutputStream out = Files.newOutputStream(newPath);
			
			byte[] bytes = new byte[100000];
			
			int chk = 0;
			while(chk!=-1) {
				chk = in.read(bytes);
				
			}
			in.close();
			out.write(bytes);
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
	

	
}
