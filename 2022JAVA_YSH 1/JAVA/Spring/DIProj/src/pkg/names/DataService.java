package pkg.names;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class DataService implements IDataHandle{
	
	private String name="";
	private int age=0;
	@Autowired
	@Qualifier("dataHandle")
	private IDataHandle dataHandle;
	
	public DataService() {}
	public DataService(IDataHandle dataHandle) {
		this.dataHandle = dataHandle;
		this.name = dataHandle.getName();
		this.age = dataHandle.getAge();
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	/*
	@Autowired	//알아서 DI시켜줌
	public void setDataHandle(DataHandle dataHandle) {
		this.dataHandle = dataHandle;
	}
	*/
	
	public String getResult() {
		String result = ":/";
		
		if(this.name.equals("몽짱")) {
			result = ":)";
		}
		
		return result;
	}
	@Override
	public String getName() {
		return null;
	}
	@Override
	public int getAge() {
		return 0;
	}
}
