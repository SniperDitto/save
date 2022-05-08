import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Scanner;

public class FileTest {
	
	public void testOutputStream() {
		try {
			FileOutputStream fOut = new FileOutputStream("c:\\FileTest\\test.txt");
			Scanner s = new Scanner(System.in);
			
			System.out.print("입력할 글자수 : ");
			int length = s.nextInt();
			
			byte[] bytes = new byte[length];
			
			for(int i = 0;i<length;i++) {
				System.out.print(i+1+" 번째 글자 입력 : ");
				bytes[i] = (byte)s.nextInt();
			}
			
			fOut.write(bytes); 
			fOut.flush();
			fOut.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void testInputStream() {
		String str = "";
		try {
			InputStream in = new FileInputStream("c:\\FileTest\\test.txt");
			int inputNum = 0;
			while(true) {
				inputNum = in.read();
				if(inputNum==-1) break;
				//System.out.print((char)inputNum);
				str += (char)inputNum;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(str);
	}
	
	public void fileClassTest() {
		//파일의 정보를 확인하는 클래스
		File file = new File("C:\\FileTest\\test.txt");
		
		String strName = file.getName();
		System.out.println(strName);
		
		String strPath = file.getPath();
		System.out.println(strPath);
		
		//맨뒤에있는 \의 위치(앞에서부터의 순서)
		//파일이름잘라내기
		String realPath = strPath.substring(strPath.lastIndexOf("\\")+1);
		System.out.println(realPath);
		
		//절대경로, getPath와 차이있음
		String str = file.getAbsolutePath();
		System.out.println(str);
		
		//파일크기
		long lLength = file.length();
		System.out.println(lLength);
		
		if(file.exists()) {
			System.out.println("이미 있는 파일");
		}
		
	}
	
	//File orgFile, String copyDir - 복사할 위치 지정
	public void fileCopy(File orgFile) {
		
		try {
			//원래파일 이름만
			String orgFileName = orgFile.getName();
			//만들 위치
			String copyDir = "C:\\FileTest\\";
			//새파일의 전체 이름 aaa.txt
			String copyFileFName = "";
			//새파일의 이름 & 확장자 : aaa, .txt 를 원래파일에서 잘라내기
			//이름은 처음부터 .위치 전까지
			//확장자는 .부터 끝까지
			String copyFileOName = orgFileName.substring(0,orgFileName.lastIndexOf("."));
			String copyFiletype = orgFileName.substring(orgFileName.lastIndexOf("."));
			
			if(orgFile.exists()) {
				//이부분 반복문으로 고치기
				//이름 고쳤는데 또 그 이름이 중복일 수도 있으므로
				
				System.out.println("이미 존재하는 파일");
				//이미 존재하는 파일인 경우
				//aaa + _copy + .txt 로
				copyFileFName = copyFileOName+"_copy"+copyFiletype;
			}else {
				copyFileFName = copyFileOName+copyFiletype;
			}
			
			File copiedFile = new File(copyDir+copyFileFName);
			//input, output Stream
			FileInputStream input = new FileInputStream(orgFile);
			FileOutputStream output = new FileOutputStream(copiedFile);
			
			//orgFile의 크기
			long oFileLength = orgFile.length();
			
			//byte의 배열 만들기
			//보통은 넉넉하게 크게 만든다
			byte[] oFileBytes = new byte[(int)oFileLength];
			
			while(true) {
				//읽은 내용을 괄호안에 저장
				//readInt -1이면 더 읽을 내용 없음
				int readInt = input.read(oFileBytes);
				if(readInt==-1) {
					break;
				}
			}
			output.write(oFileBytes);
			output.flush();
			output.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
}
