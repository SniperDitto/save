package pkg.service;

import java.util.ArrayList;

public class NameService {
	
	public ArrayList<String> getNames(){
		ArrayList<String> names = new ArrayList<String>();
		
		//db 연결해서 받아온 데이터들이라고 가정
		names.add("홍길동");
		names.add("전우치");
		names.add("신데렐라");
		
		return names;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
