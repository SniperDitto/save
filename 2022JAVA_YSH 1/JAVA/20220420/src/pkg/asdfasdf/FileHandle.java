package pkg.asdfasdf;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileHandle {
	
	public byte[] fileToBytes(String dir, String fileName) {
		byte[] results = null;
		String fullPath = dir + fileName;
		
		File file = new File(fullPath);
		FileInputStream input;
		try {
			input = new FileInputStream(file);
			
			int fileLength = (int)file.length();
			byte[] bytes = new byte[fileLength];
			
			while(input.read(bytes) != -1) {
				
			}
			results = bytes;
			input.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return results;
	}
	
	
	public void copyFile(String oldDir, String newDir, String fileName) {
		byte[] bytes = fileToBytes(oldDir, fileName);
		
		File newFile = new File(chkPath(newDir,fileName));
		try {
			FileOutputStream out = new FileOutputStream(newFile);
			out.write(fileToBytes(oldDir, fileName));
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}


	private String chkPath(String dir, String fileName) {
		String resultPath = dir+fileName;
		String onlyName = fileName.substring(0,fileName.lastIndexOf("."));
		String onlyExt = fileName.substring(fileName.lastIndexOf("."));
		File f = new File(resultPath);
		int cnt = 1;
		while (f.exists()) {
			cnt++;
			resultPath = dir + onlyName + "("+Integer.toString(cnt)+")" + onlyExt;
			f = new File(resultPath);
		}
		return resultPath;
	}
	
	
	
	
}
