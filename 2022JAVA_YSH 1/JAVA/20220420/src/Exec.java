import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class Exec {
	public static void main(String[] args) {
		
		File file = new File("c:\\TestFile\\");
		try {
			FileInputStream in = new FileInputStream(file);
			FileOutputStream out = new FileOutputStream(file);
			
			out.write(1);
			out.flush();
			out.close();
			
			long fileLength = file.length();
			byte[] bytes = new byte[102400]; 
			byte[] bytes2 = new byte[(int) fileLength]; 
			
			int cnt = 0;
			while(true) {
				cnt = in.read(bytes);
				if(cnt==-1) {
					break;
				}
			}
			
			in.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}
}
