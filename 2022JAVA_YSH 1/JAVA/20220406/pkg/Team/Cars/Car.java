package pkg.Team.Cars;

//추상클래스 - 인스턴스화 불가
public abstract class Car {
	
	//1. 속성의 추상화
	private String carName;
	private int maxSpeed;
	private int nowSpeed;
	private Engine carEngine;
	
	//2. 생성자
	//속성 값을 사용자가 초기화하게 할 것인지
	//속성의 초기값을 미리 결정할 것인지 -> 생성자에 값을 받음
	public Car() {
		this.setNowSpeed(0);
	}
	public Car(String carName, int maxSpeed) {
		this.carName = carName;
		this.maxSpeed = maxSpeed;
		this.setNowSpeed(0);
	}
	
	//3. 추상메서드
	public abstract void carRun();//차는 달릴 수 있어야 함
	public abstract void fixEngine();//차는 반드시 어떤 엔진이든 장착하고 있어야 함
	//자동차라면 반드시 하는 행위들을 만들어 둔다
	//구현은 상속 받는 쪽에서 알아서 하도록 한다
	//상속 받는 쪽에서 반드시 구현해야 한다(추상메서드, 추상멤버)
	
	public void speedUP() {
		this.setNowSpeed(this.getNowSpeed() + 5);
		System.out.println("현재 속도 5 증가");
	}
	
	
	//4. private 멤버들에 대한 getter, setter
	public String getCarName() {
		return carName;
	}
	public int getMaxSpeed() {
		return maxSpeed;
	}
	public void setMaxSpeed(int maxSpeed) {
		this.maxSpeed = maxSpeed;
	}
	public int getNowSpeed() {
		return nowSpeed;
	}
	public void setNowSpeed(int nowSpeed) {
		this.nowSpeed = nowSpeed;
	}
	public Engine getCarEngine() {
		return carEngine;
	}
	//같은 패키지 내에서 상속받는 클래스들만 접근 가능(캡슐화)
	protected void setCarEngine(Engine carEngine) {
		this.carEngine = carEngine;
	}
	
	
	
	
}
