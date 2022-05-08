package pkg.FileTest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Scanner;

public class FileTest {
	
	public void writeFile(String dir) {
		try {
			FileOutputStream fo = new FileOutputStream(dir);
			
			//내용입력받기
			/*
			 * ㅁㄴㅇㄹㄴㅁㄹㄴㅁㅇㄹ
			 * 
			 * 입력내용 길이 따라 byte[] 만들기
			 * 
			 * write flush close
			 * 
			 */
			Scanner s = new Scanner(System.in);
			
			System.out.print("입력할 글자수 : ");
			int length = s.nextInt();
			
			byte[] bytes = new byte[length];
			
			for(int i = 0;i<length;i++) {
				System.out.print(i+1+" 번째 글자 입력 : ");
				bytes[i] = (byte)s.nextInt();
			}
			
			fo.write(bytes); 
			fo.flush();
			fo.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void readFile(File file) {
		String strResult = "";
		try {
			FileInputStream fin = new FileInputStream(file);
			byte[] bytes = new byte[(int) file.length()];
			int inputCnt = 0;
			
			while(true) {
				inputCnt = fin.read(bytes);
				if(inputCnt==-1) break;
			}
			
			for(byte b : bytes) {
				strResult += (char)b;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(strResult);
		
	}
	
	public void fileCopy(File file, String dir) {
		//복사할 새 파일 만들기
		String fileName = file.getName();
		String newFileName = "";
		String onlyName = fileName.substring(0,fileName.lastIndexOf("."));
		String extName = fileName.substring(fileName.lastIndexOf("."));
		
		File newDir = new File(dir);
		if(!newDir.exists()) {
			newDir.mkdir();
			System.out.println("새 폴더 생성");
		}
		
		File newFile = new File(dir + newFileName);
		newFileName = onlyName + extName;
		
		int existCnt = 1;
		while(true) {
			if(newFile.exists()) {
				existCnt++;
				newFileName = onlyName + "_" + Integer.toString(existCnt) + extName;
				newFile = new File(dir + newFileName);
				System.out.println(newFileName);
			}
			else{
				break;
			}
		}

		//----------------------------------------------------
		//원래파일내용 새파일로 복사하기
		long oldFileLength = file.length();//파일용량이크면...no
		//int downcasting 하다 손실될 수 있음
		byte[] oldFileBytes = new byte[(int)oldFileLength];
		
		try {
			FileInputStream in = new FileInputStream(file);
			FileOutputStream out = new FileOutputStream(newFile);
			
			while(true) {
				int readInt = in.read(oldFileBytes);
				if(readInt==-1) break;
			}
			
			out.write(oldFileBytes);
			out.flush();
			out.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
}
