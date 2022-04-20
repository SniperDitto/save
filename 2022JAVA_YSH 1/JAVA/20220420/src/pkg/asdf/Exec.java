package pkg.asdf;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;

public class Exec {
	
	public String name;
	
	public static void main(String[] args) {
	
		try {
			FileManager fm = new FileManager();
			
			fm.fileToBytes("C:\\FileTest", "1234.txt");
			fm.fileToBytes("C:\\FileTest", "aaa.xlsx");
			
			
			ArrayList<byte[]> arrSavedBytes = fm.getSavedBytes();
			
			
			
			for(byte[] bytes : arrSavedBytes) {
				File file = new File("C:\\app2");
				FileOutputStream output = new FileOutputStream(file);
				output.write(bytes);
				
				output.flush();
				output.close();
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
