package pkg.FileControl;

import java.io.File;
import java.sql.ResultSet;

import pkg.DB.DBControl;

public class FileControl {
	
	public void writeResult(ResultSet rs) {
		DBControl db = new DBControl();
		//ArrayList -> byte?
		//속성이름과 값 어떻게 구분할지
		Byte[] bytesB = (Byte[])db.getResList(rs).toArray();
		byte[] bytes = new byte[bytesB.length];
		int index = 0;
		String printStr = "";
		for(byte b : bytesB) {
			bytes[index] = bytesB[index].byteValue();
			printStr += bytes[index];
		}
		
		System.out.println(printStr);
		
	}
	
	private void chkDir(String dir) {
		File f = new File(dir);
		if(!f.exists()) {
			f.mkdirs();
		}
	}
	
	private String makeNewName(String dir, String fileName) {
		String onlyName = fileName.substring(0,fileName.lastIndexOf("."));
		String onlyExt = fileName.substring(fileName.lastIndexOf("."));
		String newFullName = dir + fileName;
		File f = new File(newFullName);
		int chkCnt = 1;
		
		while(true) {
			if(f.exists()) {
				chkCnt++;
				newFullName = dir + onlyName + "(" + chkCnt + ")" + onlyExt;
				f = new File(newFullName);
			}
			else {
				break;
			}
		}
		return newFullName;
	}
	
}
