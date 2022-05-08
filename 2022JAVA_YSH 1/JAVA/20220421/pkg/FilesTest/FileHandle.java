package pkg.FilesTest;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.ResultSet;

public class FileHandle {
	
	public String filePath;
	public String fileName;
	
	public FileHandle() {}
	public FileHandle(String filePath, String fileName) {
		this.filePath = filePath;
		this.fileName = fileName;
	}
	
	public String readText(){
		String strPath = "c:\\Temp\\"+"temporary.txt";
		File file = new File(strPath);
		String result = "";
		try {
			FileReader reader = new FileReader(file);
			BufferedReader bReader = new BufferedReader(reader);
			String tempStr = "";
			while(tempStr!=null) {
				tempStr = bReader.readLine();
				if(tempStr!=null) result += tempStr+"\n";
			}
			
			bReader.close();
			reader.close();
			System.out.println(result);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void writeText() {	
		try {
			//1.txt파일 하나 생성
			String strPath = "c:\\Temp\\"+"temporary.txt";
			Path path = Paths.get(strPath);
			File file = new File(strPath);
			
			if(!file.exists()) Files.createFile(path);
			
			//2. 내용 입력하기
			FileWriter writer = new FileWriter(file);
			BufferedWriter bWriter = new BufferedWriter(writer);
			
			String strContent = "유나바보";
			String oldContent = readText();
			
			System.out.println(oldContent + strContent);
			bWriter.write(oldContent + strContent);
			writer.flush();
			writer.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
