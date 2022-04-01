
public class Car {
	
	//field 속성
	public String carName;
	public int carMaxSpeed;
	public int carMaxPerson;
	
	//생성자
	//클래스가 인스턴스화 될 때(새로운 객체 생성 시)
	//자동으로 실행되는 메서드
	public Car() {
		//일반적으로 여기서 속성들의 초기값을 준다
		this.carName = "";
		this.carMaxSpeed = 200;
		this.carMaxPerson = 4;
	}
	public Car(String carName, int carMaxSpeed, int carMaxPerson) {
		this.carName = carName;
		this.carMaxSpeed = carMaxSpeed;
		this.carMaxPerson = carMaxPerson;
	}
	
	//메서드의 오버로딩(OverLoading)
	//같은 이름의 메서드 존재하나 매개변수가 다를 경우 : 서로 다른 메서드 취급
	public void SetCar() {}
	public void SetCar(String s) {}
	public void SetCar(String s, int i) {}
	
}
