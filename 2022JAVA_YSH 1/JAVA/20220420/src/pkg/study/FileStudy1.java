package pkg.study;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileStudy1 {
	
	public void copy(String oldDir, String newDir, String fileName) {
		
		//1
		chkDir(newDir);
		
		try {
			//2
			File oldFile = new File(oldDir+fileName);
			FileInputStream in = new FileInputStream(oldFile);
			long oldFileLength = oldFile.length();
			byte[] oldFileBytes = new byte[(int) oldFileLength];
			
			int oldCnt = 0;
			while(oldCnt!=-1) {
				oldCnt = in.read(oldFileBytes);
			}
			in.close();
			
			//3
			File newFile = new File(makeNewName(newDir, fileName));
			FileOutputStream out = new FileOutputStream(newFile);
			out.write(oldFileBytes);
			out.flush();
			out.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
	}
	
	private void chkDir(String newDir) {
		File newDirFile = new File(newDir);
		if(!newDirFile.exists()) {
			newDirFile.mkdirs();
		}
	}

	private String makeNewName(String newDir, String fileName) {
		String onlyName = fileName.substring(0,fileName.lastIndexOf("."));
		String onlyExt = fileName.substring(fileName.lastIndexOf("."));
		String newFullName = newDir + fileName;
		File newFile = new File(newFullName);
		int chkCnt = 1;
		
		while(true) {
			if(newFile.exists()) {
				chkCnt++;
				newFullName = newDir + onlyName + "(" + chkCnt + ")" + onlyExt;
				newFile = new File(newFullName);
			}
			else {
				break;
			}
		}
		
		return newFullName;
	}
	
}
