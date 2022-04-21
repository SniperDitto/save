package pkg.Test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.stream.Stream;

public class FilesTest2 {
	public String filePath;
	public String fileName;
	public File file;
	
	public FilesTest2() {}
	public FilesTest2(String filePath, String fileName) {
		this.filePath = filePath;
		this.fileName = fileName;
		this.file = new File(filePath + fileName);
	}
	
	public String read() {
		String result = "";
		
		try {
			BufferedReader bReader =Files.newBufferedReader(Paths.get(this.filePath+this.fileName), StandardCharsets.UTF_8);
			String strTemp = "";
			while((strTemp = bReader.readLine())!=null) {
				if(strTemp!=null) result += (strTemp);
			}
			
			bReader.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(result);
		return result;
	}
	
	public ArrayList<String> readList(){
		ArrayList<String> aList = new ArrayList<String>();
		try {
			Stream<String> stream = Files.lines(Paths.get(this.filePath+this.fileName), StandardCharsets.UTF_8);
			stream.forEach(s -> aList.add(s));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return aList;
	}
	
	public void write(String writeContent) {
		String oldContent = "";
		//파일 만들어 내용 쓰기, 파일 이미 있다면 내용 추가
		//폴더존재확인 + 생성
		File newPath = new File(this.filePath);
		if(!newPath.exists()) newPath.mkdirs();
		//파일존재확인 + 생성
		File newFile = new File(this.filePath+this.fileName);
		if(!newFile.exists()) {
			try {
				Files.createFile(newFile.toPath());
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			oldContent = read();
		}
		//내용 쓰기
		String newContent = oldContent + "\n" + writeContent;
		try {
			BufferedWriter bWriter = Files.newBufferedWriter(newFile.toPath(), StandardCharsets.UTF_8);
			bWriter.write(newContent);
			
			bWriter.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void copy() {
		
	}
	
}
