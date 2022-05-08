package pkg.asdf;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class FileHandle {
	
	private boolean checkDir(String orgDir) {
		
		boolean isResult = false;
		
		File file = new File(orgDir);
		
		if(file.exists()) {
			isResult = true;
		}
		
		return isResult;
		//���丮�� �����ϸ� treu, �������������� false;
		
	}
	
	private void bytesToFile(String copyDir, byte[] bytes, String fileName) {
		
		try {
			String strFullPath = copyDir + "\\" + fileName;
			
			File file = new File(strFullPath);
			
			FileOutputStream output = new FileOutputStream(file);
			
			output.write(bytes);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

	public void fileCopy(String orgDir, String copyDir, String fileName) {
		
		boolean isCheckDir = checkDir(copyDir);
		
		if(!isCheckDir) {
			File file = new File(copyDir);
			file.mkdirs();
		}
		
		try {
			
				String orgFullName = orgDir + "\\" + fileName;
				
				File orgFile = new File(orgFullName);
				
				//Ŭ���̾�Ʈ�� ������ ������ byte[]Ÿ������ �޸𸮿� �����Ѵ�.
				FileInputStream input = new FileInputStream(orgFile);
				
				long orgFileSize = orgFile.length();
				
				byte[] orgFileBytes = new byte[(int)orgFileSize];
				
				while(true){
					
					int readNum = input.read(orgFileBytes);
					
					if(readNum == -1) {
						break;
					}
				} //while
				
				// 
				bytesToFile(copyDir, orgFileBytes, fileName);
				

		} // try
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
