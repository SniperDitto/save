package pkg.names;

import org.springframework.stereotype.Component;

@Component
public class DataHandle {
	private String name;
	private int age;
	
	public DataHandle() {}
	public DataHandle(String name, int age) {
		//db에서 가져왔다고 가정
		this.name = name;
		this.age = age;
	}
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return this.age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
