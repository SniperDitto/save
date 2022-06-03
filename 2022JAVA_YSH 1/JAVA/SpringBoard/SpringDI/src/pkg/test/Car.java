package pkg.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("car")
public class Car {
	private String carName;
	@Autowired
	private Char owner;
	public Car() {
		
	}
	public Car(String carName) {
		//생성자 오버로딩을 이용해서~
		this.carName = carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarName() {
		return this.carName;
	}
	public void setOwner(Char owner) {
		this.owner = owner;
	}
	public Char getOwner(){
		return this.owner;
	}
}
